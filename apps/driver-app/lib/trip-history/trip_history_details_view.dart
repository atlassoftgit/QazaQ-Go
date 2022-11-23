import 'dart:async';

import 'package:client_shared/theme/font.dart';
import 'package:client_shared/utility/yandex_map_functions.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../data/images.dart';
import '../generated/l10n.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import '../widgets/query_result_view.dart';

class TripHistoryDetailsView extends StatefulWidget {
  final String orderId;

  const TripHistoryDetailsView({required this.orderId, Key? key}) : super(key: key);

  @override
  State<TripHistoryDetailsView> createState() => _TripHistoryDetailsViewState();
}

class _TripHistoryDetailsViewState extends State<TripHistoryDetailsView> {
  late YandexMapController _controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      minimum: const EdgeInsets.only(top: 16, left: 5, right: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RidyBackButton(titleRidyBackButton: S.of(context).back),
            Query(
              options: QueryOptions(
                  document: GET_ORDER_DETAILS_QUERY_DOCUMENT,
                  variables: GetOrderDetailsArguments(id: widget.orderId).toJson()),
              builder: (QueryResult result, {Refetch? refetch, FetchMore? fetchMore}) {
                if (result.isLoading || result.hasException) {
                  return QueryResultView(result);
                }

                final order = GetOrderDetails$Query.fromJson(result.data!).order!;
                final points =
                    order.points.map((e) => Point(latitude: e.lat, longitude: e.lng)).toList();
                final newBounds = getBoundingBoxOfPoints(points);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        DateFormat('MMM.dd.yyyy').format(order.expectedTimestamp),
                        style: MyFont.style(fontSize: 18, color: colorScheme.onSecondaryContainer),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(color: Color(0x10000000), offset: Offset(1, 2), blurRadius: 20)
                      ]),
                      child: SizedBox(
                        height: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: YandexMap(
                            onMapCreated: (controller) {
                              _controller = controller;

                              Future.delayed(const Duration(milliseconds: 300), () {
                                _controller.moveCamera(
                                  CameraUpdate.newBounds(newBounds),
                                );
                              });
                            },
                            mapObjects: getPlacemarksFromPoints(points: points),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 80,
                      child: Card(
                        elevation: 10,
                        color: Colors.white,
                        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(children: [
                            Text(
                              S.of(context).payment_method,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            Image.asset(
                              order.paymentGatewayId == null ? Images.iconCash : Images.iconCash,
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22), topRight: Radius.circular(22)),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                          Text(
                            S.of(context).trip_information,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SizedBox(
                                width: 24,
                                child: Image.asset(
                                  Images.iconStartPoint,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  order.addresses.first,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                order.startTimestamp != null
                                    ? DateFormat('HH:mm a').format(order.startTimestamp!)
                                    : "-",
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 12, top: 4, bottom: 4),
                            child: DottedLine(
                              direction: Axis.vertical,
                              dashColor: CustomTheme.neutralColors,
                              lineLength: 20,
                              lineThickness: 2.0,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 24,
                                child: Image.asset(Images.iconEndPoint),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  order.addresses.last,
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                order.finishTimestamp != null
                                    ? DateFormat('HH:mm a').format(order.finishTimestamp!)
                                    : "-",
                                style: Theme.of(context).textTheme.labelSmall,
                              )
                            ],
                          )
                        ]),
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension PointMixinHeper on PointMixin {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}

LatLng computeCentroid(List<LatLng> points) {
  double latitude = 0;
  double longitude = 0;
  int n = points.length;

  for (LatLng point in points) {
    latitude += point.latitude;
    longitude += point.longitude;
  }

  return LatLng(latitude / n, longitude / n);
}
