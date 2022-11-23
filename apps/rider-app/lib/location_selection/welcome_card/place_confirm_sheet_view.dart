import 'dart:async';

import 'package:client_shared/utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';
import 'package:client_shared/components/marker_new.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../generated/l10n.dart';
import '../../utulity/rider_map_functions.dart';

class PlaceConfirmSheetView extends StatefulWidget {
  final FullLocation? defaultLocation;

  const PlaceConfirmSheetView(this.defaultLocation, {Key? key}) : super(key: key);

  @override
  State<PlaceConfirmSheetView> createState() => _PlaceConfirmSheetViewState();
}

class _PlaceConfirmSheetViewState extends State<PlaceConfirmSheetView> {
  final Completer<YandexMapController> completer = Completer();
  late YandexMapController _controller;
  String? address;
  final List<SearchSessionResult> results = [];
  FullLocation? defaultLocation;

  @override
  void initState() {
    defaultLocation = widget.defaultLocation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        YandexMap(
          nightModeEnabled: MediaQuery.of(context).platformBrightness == Brightness.dark,
          mapObjects: const [],
          onCameraPositionChanged: (p, reason, isChanged) async {
            if (isChanged) {
              results.clear();
              final resultWithSession = YandexSearch.searchByPoint(
                point: p.target,
                zoom: p.zoom.toInt(),
                searchOptions: const SearchOptions(
                  searchType: SearchType.none,
                ),
              );
              await init(resultWithSession.result, resultWithSession.session, results, address);
              setState(() {
                address = getTrueAddress(getAddresses(results).first);
              });
            } else {
              setState(() {
                address = null;
              });
            }
          },
          onMapCreated: (controller) async {
            completer.complete(controller);
            _controller = controller;

            if (defaultLocation == null) {
              Geolocator.getCurrentPosition().then((value) {
                controller.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: value.toPoint(),
                      zoom: 18,
                    ),
                  ),
                );
              });
            } else {
              controller.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: defaultLocation!.latlng.toPoint(),
                    zoom: 18,
                  ),
                ),
              );
            }

            final cameraPosition = await controller.getCameraPosition();
            final resultWithSession = YandexSearch.searchByPoint(
              point: cameraPosition.target,
              zoom: cameraPosition.zoom.toInt(),
              searchOptions: const SearchOptions(
                searchType: SearchType.none,
              ),
            );
            await init(resultWithSession.result, resultWithSession.session, results, address);
            setState(() {
              address = getTrueAddress(getAddresses(results).first);
            });
          },
        ),
        Positioned(top: h / 2.8, child: MarkerNew(address: address)),
        Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            minimum: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                onPressed: address == null
                    ? null
                    : () async {
                        final point = await _controller.getCameraPosition();
                        final newLocation = FullLocation(
                          latlng: LatLng(point.target.latitude, point.target.longitude),
                          address: address!,
                          title: defaultLocation?.title ?? "",
                        );
                        Navigator.of(context).pop(
                          newLocation,
                        );
                      },
                child: Text(S.of(context).action_confirm_location,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
