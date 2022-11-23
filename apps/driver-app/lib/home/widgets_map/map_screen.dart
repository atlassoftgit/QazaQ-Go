import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../data/global_variables.dart';
import '../../widgets/driver_distance_select_view.dart';
import '../../widgets/query_result_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/current_location_cubit.dart';
import '../../generated/l10n.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import '../../main_bloc.dart';
import '../../widgets/unregistered_driver_messages_view.dart';
import '../widgets_search/current_view_button.dart';
import 'map_manager.dart';
import '../widgets_search/menu_button.dart';
import '../widgets_search/notice_bar.dart';
import '../widgets_service/order_status_card_view.dart';
import '../widgets_search/orders_carousel_view.dart';
import '../widgets_search/status_button.dart';
import '../widgets_search/wallet_button.dart';

@immutable
class MapScreen extends StatefulWidget with WidgetsBindingObserver {
  MapScreen({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Refetch? refetch;
  bool _toShowNoticeBar = false;

  @override
  initState() {
    super.initState();

    mapEngine.cameraService.moveToCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final mainBloc = context.read<MainBloc>();
    final locationCubit = context.read<CurrentLocationCubit>();

    return LifecycleWrapper(
      onLifecycleEvent: (event) {
        if (event == LifecycleEvent.active && refetch != null) {
          refetch!();
        }
      },
      child: Stack(
        children: [
          const MapManager(),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              return Query(
                options: QueryOptions(
                  document: ME_QUERY_DOCUMENT,
                  variables: MeArguments(
                    versionCode: int.parse(
                      snapshot.data?.buildNumber ?? '999999',
                    ),
                  ).toJson(),
                  fetchPolicy: FetchPolicy.noCache,
                ),
                builder: (QueryResult result, {Refetch? refetch, FetchMore? fetchMore}) {
                  if (result.hasException) {
                    return QueryResultView(result);
                  }

                  if (!result.isLoading) {
                    this.refetch = refetch;
                    final mquery = Me$Query.fromJson(result.data!);

                    if (mquery.requireUpdate == VersionStatus.mandatoryUpdate) {
                      mainBloc.add(VersionStatusEvent(mquery.requireUpdate));
                    } else {
                      mainBloc.add(DriverUpdated(mquery.driver!));
                      locationCubit.setRadius(mquery.driver!.searchDistance);
                    }
                  }
                  return BlocConsumer<MainBloc, MainState>(
                    listenWhen: (MainState previous, MainState current) {
                      if (previous is StatusUnregistered &&
                          current is StatusUnregistered &&
                          previous.driver?.status == current.driver?.status) {
                        return false;
                      }
                      if ((previous is StatusOnline || previous is StatusOffline) &&
                          current is StatusOnline) {
                        return false;
                      }
                      return true;
                    },
                    listener: (context, state) {
                      if (state is StatusUnregistered &&
                          state.driver!.status == DriverStatus.waitingDocuments) {
                        Navigator.pushNamed(context, 'register');
                      }
                      if (state is StatusOnline) {
                        refetch!();
                      }
                    },
                    buildWhen: (previous, next) {
                      if (previous is StatusOnline && next is StatusOnline) {
                        if (next.orders.isEmpty != _toShowNoticeBar) {
                          return true;
                        }

                        if (previous.driver?.wallets.sum((p0) => p0.balance) ==
                            next.driver?.wallets.sum((p0) => p0.balance)) {
                          return false;
                        }
                      }
                      return true;
                    },
                    builder: (context, state) {
                      _toShowNoticeBar =
                          state is StatusOffline || state is StatusOnline && state.orders.isEmpty;

                      print('Rebuilded!');

                      if (state.driver == null) {
                        return Container();
                      }
                      if (state is StatusUnregistered) {
                        return UnregisteredDriverMessagesView(driver: state.driver!);
                      }

                      return Stack(
                        children: [
                          Container(),
                          SafeArea(
                            minimum: const EdgeInsets.all(8),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.98,
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MenuButton(),
                                  WalletButton(
                                    state: state,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (result.isLoading) ...[
                            Positioned(
                              bottom: 100,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Center(
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                ),
                              ),
                            )
                          ] else ...[
                            Positioned(
                              bottom: 0,
                              child: SafeArea(
                                top: false,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      if (state is! StatusInService) ...[
                                        StatusButton(state: state),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                      if (state is StatusOnline) ...[
                                        OrdersCarouselView(),
                                        const SizedBox(height: 10)
                                      ],
                                      if (_toShowNoticeBar)
                                        NoticeBar(
                                          title: state is StatusOffline
                                              ? S.of(context).get_online_to_see_requests
                                              : S.of(context).searching_for_ride,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 220,
                              right: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (state is StatusOnline)
                                    const CurrentViewButton(
                                      size: 60,
                                    ),
                                  if (state is StatusOnline && state.orders.isEmpty) ...[
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const DriverDistanceSelect(),
                                  ] else ...[
                                    const SizedBox(
                                      height: 120,
                                    ),
                                  ]
                                ],
                              ),
                            ),
                            if (state is StatusInService && state.driver!.currentOrders.isNotEmpty)
                              Positioned(
                                bottom: 0,
                                child: Subscription(
                                  options: SubscriptionOptions(
                                    document: ORDER_UPDATED_SUBSCRIPTION_DOCUMENT,
                                    fetchPolicy: FetchPolicy.noCache,
                                  ),
                                  builder: (QueryResult result) {
                                    if (result.data != null) {
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        refetch!();
                                      });
                                    }
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: OrderStatusCardView(
                                        order: state.driver!.currentOrders.first,
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
