import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client_shared/components/ridy_sheet_view.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../generated/l10n.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';
import 'package:ridy/main/bloc/main_bloc.dart';
import 'package:ridy/main/bloc/rider_profile_cubit.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:latlong2/latlong.dart';

import '../../address/address_item_view.dart';
import '../../main/bloc/current_location_cubit.dart';

class WelcomeCardView extends StatelessWidget {
  Refetch? refetchAddress;

  WelcomeCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RidySheetView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<RiderProfileCubit, GetCurrentOrder$Query$Rider?>(
            builder: (context, state) {
              return Text(
                "${S.of(context).hello_welcome}${state?.firstName != null ? " ${state!.firstName!}" : ""}!",
                style: Theme.of(context).textTheme.labelMedium,
              );
            },
          ).pOnly(bottom: 2),
          Text(
            S.of(context).where_going_welcome,
            style: Theme.of(context).textTheme.headlineMedium,
          ).pOnly(),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(vertical: 8),
            onPressed: () async {
              final List<FullLocation>? result = await showBarModalBottomSheet(
                  context: context,
                  builder: (context) => PlaceSearchSheetView(
                      context.read<CurrentLocationCubit>().state));
              if (result == null) return;
              context
                  .read<MainBloc>()
                  .add(ShowPreview(points: result, selectedOptions: []));
            },
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
                decoration: BoxDecoration(
                    color: CustomTheme.neutralColors.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/search_car.png',
                      height: 30,
                    ),
                    Text(S.of(context).where_destination_welcome,
                            style: Theme.of(context).textTheme.labelLarge)
                        .pOnly(left: 8),
                    const VerticalDivider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Image.asset(
                      'images/go_icon.png',
                      height: 30,
                    ),
                  ],
                )),
          ),
          BlocBuilder<RiderProfileCubit, GetCurrentOrder$Query$Rider?>(
            builder: (context, state) {
              if (state == null) {
                return const SizedBox();
              }
              return Column(
                children: const [
                  // const Divider(),
                  //         Container(
                  //           constraints: const BoxConstraints(maxHeight: 150),
                  //           child: SingleChildScrollView(
                  //             child: LifecycleWrapper(
                  //               onLifecycleEvent: (event) {
                  //                 if (event == LifecycleEvent.active &&
                  //                     refetchAddress != null) {
                  //                   refetchAddress!();

                  //                   print('refetch');
                  //                 }
                  //               },
                  //               child: Query(
                  //                 options: QueryOptions(
                  //                     document: GET_ADDRESSES_QUERY_DOCUMENT),
                  //                 builder: (QueryResult result,
                  //                     {Refetch? refetch, FetchMore? fetchMore}) {
                  //                   if (result.isLoading) {
                  //                     return const Center(
                  //                       child: CupertinoActivityIndicator(),
                  //                     );
                  //                   }
                  //                   refetchAddress = refetch;
                  //                   final addresses = result.data != null
                  //                       ? GetAddresses$Query.fromJson(result.data!)
                  //                           .riderAddresses
                  //                       : <GetAddresses$Query$RiderAddress>[];
                  //                   return Column(
                  //                     mainAxisSize: MainAxisSize.min,
                  //                     children: addresses
                  //                         .map(
                  //                           (GetAddresses$Query$RiderAddress address) =>
                  //                               WelcomeCardSavedLocationButton(
                  //                             onTap: () {
                  //                               final currentLocation = context
                  //                                   .read<CurrentLocationCubit>()
                  //                                   .state;
                  //                               if (currentLocation == null) {
                  //                                 showLocationNotDeterminedDialog(
                  //                                     context);
                  //                                 return;
                  //                               }
                  //                               context.read<MainBloc>().add(
                  //                                     ShowPreview(
                  //                                       points: [
                  //                                         currentLocation,
                  //                                         address.toFullLocation()
                  //                                       ],
                  //                                       selectedOptions: [],
                  //                                     ),
                  //                                   );
                  //                             },
                  //                             type: address.type,
                  //                             address: address.details,
                  //                           ),
                  //                         )
                  //                         .toList(),
                  //                   );
                  //                 },
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  void showLocationNotDeterminedDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).title_location_error),
            content: Text(S.of(context).body_location_error),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK", textAlign: TextAlign.end))
            ],
          );
        });
  }
}

extension RiderAddressToFullLocation on GetAddresses$Query$RiderAddress {
  FullLocation toFullLocation() {
    return FullLocation(
        latlng: LatLng(location.lat, location.lng),
        address: details,
        title: title);
  }
}

class WelcomeCardSavedLocationButton extends StatelessWidget {
  final Function() onTap;
  final RiderAddressType type;
  final String address;

  const WelcomeCardSavedLocationButton(
      {required this.onTap,
      required this.type,
      required this.address,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 8),
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddressListIcon(getAddressTypeIcon(type)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getAddressTypeName(context, type),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  address,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
