import 'dart:async';

import 'package:client_shared/utility/extensions.dart';
import 'package:client_shared/utility/location_data.dart';
import 'package:client_shared/utility/yandex_map_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ridy/data/global.dart';
import 'package:ridy/main/bloc/driver_placemarks_cubit.dart';
import 'package:ridy/main/bloc/map_objects_cubit.dart';
import 'package:ridy/main/map/yandex_map_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../graphql/generated/graphql_api.dart';
import '../../location_selection/location_selection_parent_view.dart';
import '../../location_selection/welcome_card/place_search_sheet_view.dart';
import '../../utulity/rider_map_functions.dart';
import '../bloc/current_location_cubit.dart';
import '../bloc/main_bloc.dart';

import '../bloc/rider_profile_cubit.dart';

class YandexMapManager extends StatefulWidget {
  const YandexMapManager({Key? key}) : super(key: key);

  @override
  State<YandexMapManager> createState() => _YandexMapManagerState();
}

class _YandexMapManagerState extends State<YandexMapManager>
    with TickerProviderStateMixin {
  Refetch? _refetch;
  bool _isJamsVisible = false;
  bool _isOrderNew = true;

  @override
  void initState() {
    super.initState();

    final mainBloc = context.read<MainBloc>();

    Geolocator.getCurrentPosition().then((value) async {
      mainBloc.add(MapMoved(LatLng(value.latitude, value.longitude)));
    });
  }

  Future<void> _buildObjects() async {
    final objects = <MapObject>[];
    final mapObjects = context.read<MapObjectsCubit>();

    await navigationService.generateRoutes();

    objects
      ..addAll(
          polylinesFromRoute(navigationService.route, includeTrafficJam: true))
      ..addAll(
        getPlacemarksFromPoints(
          points: navigationService.points,
          home: navigationService.homePoint,
          destination: navigationService.destinationPoint,
        ),
      );

    mapObjects.setObjects(objects);
  }

  Future<void> _initializeNavigatorService({
    required List<Point> points,
    required Point home,
  }) async {
    if (_isOrderNew) {
      _isOrderNew = false;
    } else {
      return;
    }

    navigationService.reinitialize(
      userLocation: LocationData(
        point: home,
        azimuth: azimuthService.value,
      ),
      points: points,
      orderId: '',
    );

    await _buildObjects();

    final newBounds = getBoundingBoxOfPoints(
      navigationService.route.geometry,
      boundingConstant: BoundingBoxType.riderMap,
    );

    mapController?.moveCamera(
      CameraUpdate.newBounds(newBounds),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mapObjects = context.read<MapObjectsCubit>();
    final driverPlacemarks = context.read<DriverPlacemarksCubit>();
    final mainBloc = context.read<MainBloc>();

    return Stack(
      children: [
        const YandexMapProvider(),
        FloatingActionButton(
            heroTag: 'jam',
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              _isJamsVisible = !_isJamsVisible;
              mapController?.toggleTrafficLayer(visible: _isJamsVisible);
            },
            child: const Icon(
              Icons.traffic,
              size: 30,
            )).safeArea(minimum: const EdgeInsets.all(10)).objectTopRight(),
        LifecycleWrapper(
          onLifecycleEvent: (event) {
            if (event == LifecycleEvent.visible && _refetch != null) {
              _refetch!();
            }
          },
          child: FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              return Query(
                options: QueryOptions(
                  document: GET_CURRENT_ORDER_QUERY_DOCUMENT,
                  variables: GetCurrentOrderArguments(
                    versionCode:
                        int.parse(snapshot.data?.buildNumber ?? "99999"),
                  ).toJson(),
                  fetchPolicy: FetchPolicy.noCache,
                ),
                builder: (QueryResult result,
                    {Refetch? refetch, FetchMore? fetchMore}) {
                  if (result.isLoading) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }

                  _refetch = refetch;
                  final query = result.data != null
                      ? GetCurrentOrder$Query.fromJson(result.data!)
                      : null;

                  if (result.data != null && query != null) {
                    context
                        .read<RiderProfileCubit>()
                        .updateProfile(query.rider!);
                    if (query.requireUpdate == VersionStatus.mandatoryUpdate) {
                      mainBloc.add(VersionStatusEvent(query.requireUpdate));
                    } else if (Hive.box('user').get('jwt') == null) {
                      mainBloc.add(
                        ProfileUpdated(
                          profile: query.rider!,
                          driverLocation: query.getCurrentOrderDriverLocation,
                        ),
                      );
                    }
                  }

                  return const SizedBox();
                },
              );
            },
          ),
        ),
        BlocConsumer<MainBloc, MainBlocState>(
          listener: (context, state) {
            print('Listener $state');

            if (state is SelectingPoints) {
              _isOrderNew = true;
            }
            if (state is OrderPreview) {
              final points =
                  state.points.map((e) => e.latlng.toPoint()).toList();

              _initializeNavigatorService(
                points: points,
                home: points.first,
              );
            }
            if (state is StateWithActiveOrder) {
              final points = state.currentOrder.points
                  .map((e) => e.toLatLng().toPoint())
                  .toList();

              _initializeNavigatorService(
                points: points,
                home: points.first,
              );
            }
            if (state is SelectingPoints) {
              mapObjects.clearObjects();
              moveToCurrentPosition();
            }
          },
          builder: (context, state) {
            print('Builder $state');

            return Stack(
              children: [
                if (state is SelectingPoints)
                  FutureBuilder<Position>(
                    future: Geolocator.getCurrentPosition(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setCurrentLocation(context, snapshot.data!);
                        });
                      }
                      return BlocBuilder<CurrentLocationCubit, FullLocation?>(
                        builder: (context, currentLocation) {
                          if (currentLocation == null) {
                            return const SizedBox();
                          }

                          return Query(
                            options: QueryOptions(
                              document: GET_DRIVERS_LOCATION_QUERY_DOCUMENT,
                              variables: GetDriversLocationArguments(
                                      point: currentLocation.toPointInput())
                                  .toJson(),
                            ),
                            builder: (QueryResult result,
                                {Refetch? refetch, FetchMore? fetchMore}) {
                              if (result.isLoading || result.hasException) {
                                return const SizedBox();
                              }

                              final List<PointMixin> locations =
                                  GetDriversLocation$Query.fromJson(
                                          result.data!)
                                      .getDriversLocation;
                              print(locations);
                              print(locations.length);
                              driverPlacemarks.setObjects(locations
                                  .map(
                                    (e) => PlacemarkMapObject(
                                      icon: PlacemarkIcon.single(
                                        PlacemarkIconStyle(
                                          image:
                                              BitmapDescriptor.fromAssetImage(
                                            'images/taxi.png',
                                          ),
                                        ),
                                      ),
                                      mapId: MapObjectId(
                                        e.toString(),
                                      ),
                                      point: Point(
                                        latitude: e.lat,
                                        longitude: e.lng,
                                      ),
                                    ),
                                  )
                                  .toList());

                              return const SizedBox();
                            },
                          );
                        },
                      );
                    },
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
