import 'dart:async';

import 'package:client_shared/utility/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:ridy/main/bloc/driver_placemarks_cubit.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/global.dart';
import '../../utulity/rider_map_functions.dart';
import '../bloc/map_objects_cubit.dart';

class YandexMapProvider extends StatefulWidget {
  const YandexMapProvider({Key? key}) : super(key: key);

  @override
  State<YandexMapProvider> createState() => _YandexMapProviderState();
}

class _YandexMapProviderState extends State<YandexMapProvider> {
  late StreamSubscription _motionStream;

  @override
  void initState() {
    super.initState();

    _motionStream = motionSensors.absoluteOrientation
        .listen((AbsoluteOrientationEvent event) {
      final azimuth = radianToDegree(event.yaw);

      azimuthService.addAzimuth(azimuth);
    });
  }

  @override
  void dispose() {
    _motionStream.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapObjectsCubit, List<MapObject>>(
      builder: (context, mapObjects) {
        return BlocBuilder<DriverPlacemarksCubit, List<MapObject>>(
            builder: (context, driverPlacemarks) {
          return YandexMap(
            mapObjects: [...mapObjects, ...driverPlacemarks],
            indoorEnabled: true,
            nightModeEnabled:
                MediaQuery.of(context).platformBrightness == Brightness.dark,
            onUserLocationAdded: (UserLocationView view) async {
              return view.copyWith(
                  pin: view.pin.copyWith(
                    opacity: 1,
                    icon: PlacemarkIcon.single(
                      PlacemarkIconStyle(
                        image: BitmapDescriptor.fromAssetImage(
                          'images/current_location.png',
                        ),
                      ),
                    ),
                  ),
                  accuracyCircle: view.accuracyCircle.copyWith(
                    fillColor: Colors.blue.withOpacity(0.2),
                    strokeColor: Colors.blue.withOpacity(0.4),
                    strokeWidth: 1,
                  ));
            },
            onMapTap: (Point point) async {
              await mapController?.deselectGeoObject();
            },
            onObjectTap: (GeoObject geoObject) async {
              if (geoObject.selectionMetadata != null) {
                await mapController?.selectGeoObject(
                    geoObject.selectionMetadata!.id,
                    geoObject.selectionMetadata!.layerId);
              }
            },
            onMapCreated: (controller) {
              mapController = controller;
              mapController?.toggleUserLayer(visible: true);
              controller.toggleUserLayer(visible: true);
              moveToCurrentPosition();
            },
          );
        });
      },
    );
  }
}
