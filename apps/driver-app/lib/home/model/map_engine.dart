import 'dart:async';

import 'package:client_shared/utility/extensions.dart';
import 'package:client_shared/utility/functions.dart';
import 'package:client_shared/utility/location_data.dart';
import 'package:client_shared/utility/yandex_map_functions.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/global_variables.dart';
import '../service/map_mode_cubit.dart';
import '../service/map_objects_cubit.dart';
import 'camera_service.dart';

class MapEngine {
  MapEngine() {
    cameraService = mapCameraService;
    mapMode = MapMode.map;
    _distanceTotal = 1;
    _distanceLeft = 0;
  }

  Timer? _engine;
  late double _distanceTotal;
  late double _distanceLeft;

  String? currentStreet;
  late MapObjectsCubit mapObjects;
  late CameraService cameraService;
  late MapMode mapMode;

  double get progress => 1 - (_distanceLeft / _distanceTotal);

  void switchMode(mode) {
    mapMode = mode;
    cameraService = mode == MapMode.map ? mapCameraService : navigatorCameraService;
  }

  void startEngine() {
    if (_engine?.isActive != true) {
      _engine = Timer.periodic(const Duration(milliseconds: 2500), (timer) async {
        final currentPoint = (await Geolocator.getCurrentPosition()).toPoint();
        final isUpdated = navigationService.update(LocationData(
          point: currentPoint,
          azimuth: azimuthService.value,
        ));

        if (isUpdated) {
          generateObjects();

          final placemark = await placemarkFromCoordinates(
            currentPoint.latitude,
            currentPoint.longitude,
          );
          _distanceLeft =
              distanceBetweenManyPoints([currentPoint, ...navigationService.points]);
          currentStreet = placemark.first.street ?? '';

          if (_distanceLeft > _distanceTotal) {
            _distanceTotal = _distanceLeft;
          }
        }

        if (mapMode == MapMode.navigator && !cameraService.isUserInteracting) {
          cameraService.updateParameter(azimuthValue: azimuthService.value);
          cameraService.moveCamera(currentPoint);
        }

        if (navigationService.isTripEnded) {
          timer.cancel();
        }
      });
    }
  }

  Future<void> generateObjects() async {
    await navigationService.generateRoutes();

    final objects = <MapObject>[];

    objects.addAll(getPlacemarksFromPoints(
      points: navigationService.points,
      home: navigationService.homePoint,
      destination: navigationService.destinationPoint,
    ));

    objects.addAll(polylinesFromRoute(
      navigationService.route,
      includeTrafficJam: true,
    ));

    mapObjects.setObjects(objects);
  }

  void stopEngine() {
    if (_engine != null && _engine!.isActive) {
      _engine!.cancel();
      _engine = null;
    }
  }
}
