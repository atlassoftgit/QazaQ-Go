import 'package:client_shared/utility/route_rotation.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../config.dart';
import 'functions.dart';
import 'location_data.dart';
import 'yandex_map_functions.dart';

class NavigationService {
  NavigationService.initialize({
    this.orderId = '',
  });

  String orderId;

  bool _forceUpdate = true;
  bool _showRouteToHome = false;
  List<RouteBend> bends = [];
  List<Point> _points = [];

  late Point homePoint;
  late Point destinationPoint;
  late LocationData userLocation;
  late LocationData _userLocationSnapshot;
  late List<DrivingRoute> _routes;

  List<Point> get points => _showRouteToHome ? [homePoint] : _points;

  Point get nextPoint => points.first;

  RouteBend? get nextBend => bends.isEmpty ? null : bends.first;

  DrivingRoute get route => _routes.first;

  bool get isTripEnded => points.isEmpty;

  bool get isNextHome => nextPoint == homePoint;

  bool get isNextDestination => points.length < 2;

  bool get didAzimuthChange => _userLocationSnapshot.azimuth != userLocation.azimuth;

  void reinitialize({
    required userLocation,
    required points,
    required orderId,
  }) {
    this.userLocation = userLocation;
    this.orderId = orderId;
    _points = points;
    _userLocationSnapshot = userLocation;
    homePoint = _points.first;
    destinationPoint = _points.last;
    _forceUpdate = true;
    _showRouteToHome = false;
  }

  void reachNextPoint() {
    if (points.isNotEmpty) {
      _points.removeAt(0);
      _forceUpdate = true;
    }
  }

  void reachHomePoint() {
    _points.remove(homePoint);
    _showRouteToHome = false;
    _forceUpdate = true;
  }

  Future<void> generateRoutes() async {
    if (points.isEmpty) {
      return;
    }

    _routes = await getDrivingRouteBetweenPoints(
      startPoint: userLocation.point,
      endPoint: points.last,
      viaPoints: points.sublist(0, points.length - 1),
      azimuth: userLocation.azimuth,
    );

    bends = getRouteBends(route.geometry);
  }

  bool didLocationChange() {
    final distanceChanged = distanceBetweenTwoPoints(
      userLocation.point,
      _userLocationSnapshot.point,
    );

    return distanceChanged >= constantUpdateThreshold;
  }

  bool update(LocationData currentLocation) {
    userLocation = currentLocation;
    _showRouteToHome = _points.contains(homePoint);

    if (_forceUpdate) {
      _forceUpdate = false;

      return true;
    }

    if (!isNextDestination &&
        distanceBetweenTwoPoints(userLocation.point, nextPoint) < constantReachThreshold) {
      reachNextPoint();

      return true;
    }

    if (didLocationChange()) {
      _userLocationSnapshot = userLocation;

      return true;
    }

    return false;
  }
}
