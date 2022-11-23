import 'dart:async';

import 'package:client_shared/theme/theme.dart';
import 'package:client_shared/utility/extensions.dart';
import 'package:client_shared/utility/location_data.dart';
import 'package:client_shared/utility/yandex_map_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/global_variables.dart';
import '../../main_bloc.dart';
import '../../widgets/current_location_cubit.dart';
import '../service/map_functions.dart';
import '../service/map_objects_cubit.dart';

class MapManager extends StatelessWidget {
  const MapManager({Key? key}) : super(key: key);

  Future<void> _initializeNavigatorService({
    required List<Point> points,
    required String orderId,
  }) async {
    if (orderId == navigationService.orderId) {
      return;
    }

    final userPosition = await Geolocator.getCurrentPosition();

    navigationService.reinitialize(
      userLocation: LocationData(
        point: userPosition.toPoint(),
        azimuth: azimuthService.value,
      ),
      points: points,
      orderId: orderId,
    );

    print('Initialized!!!!!');

    await mapEngine.generateObjects();

    final newBounds = getBoundingBoxOfPoints(
      navigationService.route.geometry,
      boundingConstant: BoundingBoxType.driverMap,
    );

    mapController?.moveCamera(
      CameraUpdate.newBounds(newBounds),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();

    return BlocConsumer<MainBloc, MainState>(
      listenWhen: (previous, next) => next is StatusOnline || next is StatusInService,
      listener: (context, state) {
        Geolocator.checkPermission().then((value) {
          if (value == LocationPermission.denied) {
            Geolocator.requestPermission();
          }
        });

        final locationCubit = context.read<CurrentLocationCubit>();
        final currentLocation = locationCubit.state.location;

        if ((state is StatusOnline && currentLocation == null) ||
            (state is StatusInService && currentLocation == null)) {
          Geolocator.getCurrentPosition().then(
            (value) => onLocationUpdated(value, mainBloc, context),
          );
        }
      },
      builder: (context, state) {
        final mapObjects = context.read<MapObjectsCubit>();

        if (state is StatusOffline) {
          mapObjects.clearObjects();
          mapEngine.stopEngine();
        } else if (state is StatusOnline) {
          mapEngine.stopEngine();

          final selectedOrder = state.selectedOrder;

          if (selectedOrder == null) {
            mapObjects.clearObjects();
          } else {
            _initializeNavigatorService(
              points: state.markers.map((e) => e.position.toPoint()).toList(),
              orderId: selectedOrder.id,
            );
          }
        } else if (state is StatusInService) {
          final selectedOrder = state.driver!.currentOrders.first;

          _initializeNavigatorService(
            points: state.markers.map((e) => e.position.toPoint()).toList(),
            orderId: selectedOrder.id,
          ).then((value) => mapEngine.startEngine());
        }

        return BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
            builder: (context, locationState) {
          if (locationState.location != null && state is StatusOnline && state.orders.isEmpty && locationState.radius != null) {
            mapObjects.setObjects([
              CircleMapObject(
                mapId: const MapObjectId('circle'),
                circle: Circle(
                  center: Point(
                    latitude: locationState.location!.latitude,
                    longitude: locationState.location!.longitude,
                  ),
                  radius: locationState.radius!.toDouble(),
                ),
                strokeColor: CustomTheme.secondaryColors.shade200,
                strokeWidth: 2,
                fillColor: Colors.blue.withOpacity(0.3),
              )
            ]);
          }

          return const SizedBox();
        });
      },
    );
  }
}
