import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:ridy/location_selection/reservation_messages/looking_sheet_view.dart';
import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';
import 'package:ridy/main/bloc/jwt_cubit.dart';
import 'package:ridy/main/bloc/rider_profile_cubit.dart';
import 'package:ridy/main/pay_for_ride_sheet_view.dart';
import 'package:ridy/main/rate_ride_sheet_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:ridy/utulity/rider_map_functions.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:latlong2/latlong.dart';

import '../graphql/generated/graphql_api.graphql.dart';
import '../main/bloc/main_bloc.dart';
import '../main/drawer_logged_in.dart';
import '../main/drawer_logged_out.dart';
import '../main/map/yandex_map_manager.dart';
import '../main/order_status_sheet_view.dart';
import '../main/service_selection_card_view.dart';
import 'welcome_card/welcome_card_view.dart';

class LocationSelectionParentView extends StatefulWidget {
  const LocationSelectionParentView({Key? key}) : super(key: key);

  @override
  State<LocationSelectionParentView> createState() => _LocationSelectionParentViewState();
}

class _LocationSelectionParentViewState extends State<LocationSelectionParentView> {
  late GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Refetch? refetch;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final mainBloc = context.read<MainBloc>();
    final jwt = Hive.box('user').get('jwt').toString();
    if (!jwt.isEmptyOrNull) {
      context.read<JWTCubit>().login(jwt);
    }
    return Scaffold(
      key: scaffoldKey,
      drawer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Drawer(
          backgroundColor: CustomTheme.primaryColors.shade100,
          child: BlocBuilder<RiderProfileCubit, GetCurrentOrder$Query$Rider?>(
              builder: (context, state) =>
                  state == null ? const DrawerLoggedOut() : DrawerLoggedIn(rider: state)),
        ),
      ),
      body: Stack(children: [
        const YandexMapManager(),
        BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
          return Stack(children: [
            if (state is OrderPreview)
              SmallBackFloatingActionButton(onPressed: () {
                setState(() => mainBloc.add(ResetState()));
              }),
            if (state is SelectingPoints)
              MenuButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                bookingCount: state.bookingsCount,
              ),
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: EdgeInsets.only(
                  bottom:
                      MediaQuery.of(context).size.width > CustomTheme.tabletBreakpoint ? 16 : 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                          heroTag: 'navigator',
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          onPressed: () => moveToCurrentPosition(),
                          child: Transform.rotate(
                            angle: pi / 6,
                            child: const Icon(
                              Icons.navigation,
                              size: 30,
                              color: Color.fromRGBO(238, 47, 44, 1),
                            ),
                          )),
                    ],
                  ).safeArea(minimum: const EdgeInsets.all(10)),
                  if (state is SelectingPoints) WelcomeCardView(),
                  if (state is OrderPreview) const ServiceSelectionCardView(),
                  if (state is StateWithActiveOrder)
                    Subscription(
                      options: SubscriptionOptions(
                          document: UPDATED_ORDER_SUBSCRIPTION_DOCUMENT,
                          fetchPolicy: FetchPolicy.noCache),
                      builder: (QueryResult result) {
                        if (result.data != null) {
                          final order = GetCurrentOrder$Query$Rider$Order.fromJson(
                              result.data!['orderUpdated']);
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            mainBloc.add(CurrentOrderUpdated(order));
                          });
                        }
                        if (state is OrderInProgress) {
                          return const OrderStatusSheetView();
                        }
                        if (state is OrderInvoice) {
                          return Mutation(
                            options: MutationOptions(document: UPDATE_ORDER_MUTATION_DOCUMENT),
                            builder: (RunMutation runMutation, QueryResult? result) {
                              return PayForRideSheetView(
                                onClosePressed: state.order.status == OrderStatus.waitingForPostPay
                                    ? null
                                    : () async {
                                        final result = await runMutation(UpdateOrderArguments(
                                          id: state.order.id,
                                          update: UpdateOrderInput(
                                            status: OrderStatus.riderCanceled,
                                            tipAmount: 0,
                                          ),
                                        ).toJson())
                                            .networkResult;
                                        final order = UpdateOrder$Mutation.fromJson(result!.data!);
                                        mainBloc.add(CurrentOrderUpdated(order.updateOneOrder));
                                      },
                                order: state.order,
                              );
                            },
                          );
                        }
                        if (state is OrderReview) {
                          return const RateRideSheetView();
                        }
                        if (state is OrderLooking) {
                          return const LookingSheetView();
                        }
                        return const Text("Unacceptable state");
                      },
                    ),
                ],
              ),
            ).centered()
          ]);
        })
      ]),
    );
  }
}

class SmallBackFloatingActionButton extends StatelessWidget {
  final Function onPressed;

  const SmallBackFloatingActionButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: FloatingActionButton.small(
        heroTag: 'back',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2,
        onPressed: () => onPressed(),
        backgroundColor: CustomTheme.primaryColors.shade50,
        child: Icon(
          Ionicons.arrow_back,
          color: CustomTheme.primaryColors.shade800,
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.onPressed,
    required this.bookingCount,
  }) : super(key: key);

  final Function onPressed;
  final int bookingCount;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: FloatingActionButton(
        heroTag: 'menuFab',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () => onPressed(),
        backgroundColor: Colors.white,
        child: bookingCount == 0
            ? Icon(
                Icons.menu,
                color: CustomTheme.primaryColors.shade800,
              )
            : Container(
                decoration:
                    BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(50)),
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: Center(
                    child: Text(
                      bookingCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

extension PlaceToFullLocation on Place {
  FullLocation toFullLocation() {
    return FullLocation(
        latlng: LatLng(lat, lon), address: displayName, title: nameDetails!['name'].toString());
  }
}

extension PointMixinHelper on PointMixin {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}

extension FullLocationHelper on FullLocation {
  PointInput toPointInput() {
    return PointInput(lat: latlng.latitude, lng: latlng.longitude);
  }
}

const fitBoundsOptions =
    FitBoundsOptions(padding: EdgeInsets.only(top: 100, bottom: 500, left: 130, right: 130));
