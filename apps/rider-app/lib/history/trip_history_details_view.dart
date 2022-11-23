import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:client_shared/config.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:client_shared/utility/yandex_map_functions.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ridy/graphql/generated/graphql_api.graphql.dart';
import 'package:ridy/query_result_view.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart' hide Point;
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../config.dart';
import '../generated/l10n.dart';
import 'submit_complaint_view.dart';

Future<GeocodeResponse> getCoordinates(String address) async {
  return geocoder.getGeocode(
    GeocodeRequest(
      geocode: AddressGeocode(address: 'Алматы, Казахстан, $address'),
      lang: Lang.ru,
    ),
  );
}

class TripHistoryDetailsView extends StatefulWidget {
  final String orderId;

  const TripHistoryDetailsView({required this.orderId, Key? key}) : super(key: key);

  @override
  State<TripHistoryDetailsView> createState() => _TripHistoryDetailsViewState();
}

class _TripHistoryDetailsViewState extends State<TripHistoryDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RidyBackButton(titleRidyBackButton: S.of(context).action_back),
            const SizedBox(height: 8),
            Expanded(
              child: Query(
                options: QueryOptions(
                    document: GET_ORDER_DETAILS_QUERY_DOCUMENT,
                    variables: GetOrderDetailsArguments(id: widget.orderId).toJson()),
                builder: (QueryResult result, {Refetch? refetch, FetchMore? fetchMore}) {
                  if (result.isLoading || result.hasException) {
                    return QueryResultView(result);
                  }

                  final order = GetOrderDetails$Query.fromJson(result.data!).order!;

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DateFormat('MMM dd yyyy').format(order.expectedTimestamp),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 300,
                          decoration: const BoxDecoration(
                              boxShadow: [BoxShadow(color: Color(0x10000000), offset: Offset(1, 2), blurRadius: 20)]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: MapContainer(order.addresses),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: CustomTheme.primaryColors.shade100, borderRadius: BorderRadius.circular(18)),
                          child: Row(
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                if (order.driver != null)
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        ("${order.driver?.firstName ?? ""} ${order.driver?.lastName ?? ""}"),
                                        style: Theme.of(context).textTheme.headlineMedium,
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(
                                        Ionicons.star,
                                        color: Color(0xffefc868),
                                        size: 15,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        order.driver?.rating?.toString() ?? "-",
                                        style: Theme.of(context).textTheme.labelSmall,
                                      )
                                    ],
                                  ),
                                Text(
                                  order.service.name,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  order.driver?.car?.name ?? "-",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: CustomTheme.primaryColors.shade400,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    order.driver?.carPlate ?? S.of(context).enum_unknown,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                )
                              ]),
                              const Spacer(),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8, top: 8, right: 8, left: 8),
                                    child:
                                        Image.network(serverUrl + order.service.media.address, width: 80, height: 80),
                                  ),
                                  if (order.driver?.media != null)
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: UserAvatarView(
                                            image: '',
                                            urlPrefix: serverUrl,
                                            url: order.driver?.media?.address,
                                            cornerRadius: 30,
                                            size: 15)),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: CustomTheme.primaryColors.shade400,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Center(
                                        child: AutoSizeText(
                                          NumberFormat.simpleCurrency(name: order.currency)
                                              .format(order.costAfterCoupon),
                                          maxLines: 1,
                                          style: Theme.of(context).textTheme.headlineMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18), color: CustomTheme.primaryColors.shade100),
                          child: Row(children: [
                            Text(
                              S.of(context).payment_method,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            if (order.paymentGateway == null)
                              const Icon(
                                Ionicons.cash,
                                color: CustomTheme.neutralColors,
                              ),
                            if (order.paymentGateway?.media != null)
                              Image.network(
                                serverUrl + order.paymentGateway!.media!.address,
                                width: 24,
                                height: 24,
                              ),
                            const SizedBox(width: 8),
                            Text(
                              order.paymentGateway == null
                                  ? S.of(context).history_payment_method_cash
                                  : order.paymentGateway!.title,
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18), color: CustomTheme.primaryColors.shade100),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                            Text(
                              S.of(context).trip_history_information,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Ionicons.navigate,
                                  color: CustomTheme.neutralColors.shade500,
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
                                    style: Theme.of(context).textTheme.labelSmall)
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
                                Icon(
                                  Ionicons.location,
                                  color: CustomTheme.neutralColors.shade500,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    order.addresses.last,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                    order.finishTimestamp != null
                                        ? DateFormat('HH:mm a').format(order.finishTimestamp!)
                                        : "-",
                                    style: Theme.of(context).textTheme.labelSmall)
                              ],
                            )
                          ]),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () async {
                              showBarModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return SubmitComplaintView(orderId: widget.orderId);
                                  });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: const BorderSide(width: 1.5, color: Color(0xffed4346)),
                            ),
                            child: Text(
                              S.of(context).issue_submit_button,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: const Color(0xffb20d0e)),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
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

class MapContainer extends StatefulWidget {
  final List<String> addresses;

  const MapContainer(this.addresses, {Key? key}) : super(key: key);

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  Completer<YandexMapController> completer = Completer();
  List<MapObject<dynamic>> mapObjects = <MapObject>[];
  List<GeocodeResponse> points = <GeocodeResponse>[];
  late YandexMapController _controller;

  Future<void> setPoints(List<String> addresses) async {
    for (final i in addresses) {
      final point = await getCoordinates(i);
      points.add(point);
    }
    for (final i in points) {
      mapObjects.add(PlacemarkMapObject(
        opacity: 1,
        mapId: MapObjectId(i.hashCode.toString()),
        point: Point(
          latitude: i.firstPoint!.latitude,
          longitude: i.firstPoint!.longitude,
        ),
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(
              'images/pin_icon.png',
            ),
            scale: 0.5,
          ),
        ),
      ));
    }
    setState(() {});
    _controller.moveCamera(
      CameraUpdate.newBounds(
        getBoundingBoxOfPoints(
          points.map((e) => Point(latitude: e.firstPoint!.latitude, longitude: e.firstPoint!.longitude)).toList(),
        ),
      ),
    );
  }

  @override
  void initState() {
    setPoints(widget.addresses);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YandexMap(
      nightModeEnabled: MediaQuery.of(context).platformBrightness == Brightness.dark,
      onMapCreated: (controller) {
        completer.complete(controller);
        _controller = controller;
        _controller.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(
                latitude: fallbackLocation.latitude,
                longitude: fallbackLocation.longitude,
              ),
              zoom: 12,
            ),
          ),
        );
      },
      mapObjects: mapObjects,
    );
  }
}
