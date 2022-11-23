import 'dart:async';

import 'package:client_shared/utility/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/global_variables.dart';
import '../../main_bloc.dart';
import '../service/map_functions.dart';
import '../service/map_mode_cubit.dart';
import '../service/map_objects_cubit.dart';

class MapProvider extends StatefulWidget {
  const MapProvider({Key? key}) : super(key: key);

  @override
  State<MapProvider> createState() => _MapProviderState();
}

class _MapProviderState extends State<MapProvider> {
  late Stream<Position> _streamServerLocation;
  late StreamSubscription _motionStream;

  @override
  void initState() {
    super.initState();

    _streamServerLocation = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(distanceFilter: 50),
    );
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
    final mainBloc = context.read<MainBloc>();

    return Stack(
      children: [
        BlocBuilder<MapModeCubit, MapMode>(
          builder: (context, mapMode) {
            return BlocBuilder<MapObjectsCubit, List<MapObject>>(
              builder: (context, mapObjects) {
                return YandexMap(
                  modelsEnabled: true,
                  zoomGesturesEnabled: true,
                  mode2DEnabled: true,
                  nightModeEnabled:
                      Theme.of(context).brightness == Brightness.dark,
                  onUserLocationAdded: (UserLocationView view) async {
                    return view.copyWith(
                      accuracyCircle: view.accuracyCircle.copyWith(
                          fillColor: Colors.blue.withOpacity(0.3),
                          strokeWidth: 1,
                          strokeColor: Colors.blue),
                    );
                  },
                  onMapCreated: (controller) {
                    mapController = controller;
                    mapController?.toggleUserLayer(visible: true);
                    mapEngine.cameraService.moveToCurrentPosition();
                  },
                  onCameraPositionChanged: (position, reason, finished) {
                    if (mapMode == MapMode.navigator &&
                        CameraUpdateReason.gestures == reason) {
                      mapEngine.cameraService.isUserInteracting = true;
                    }
                  },
                  mapObjects: mapObjects,
                );
              },
            );
          },
        ),
        StreamBuilder<Position>(
          stream: _streamServerLocation,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              onLocationUpdated(snapshot.data!, mainBloc, context);
            }
            return Container();
          },
        ),
      ],
    );
  }
}
