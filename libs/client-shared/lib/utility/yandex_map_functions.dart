import 'dart:math';

import 'package:client_shared/utility/route_rotation.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../theme/theme.dart';
import 'functions.dart';

enum BoundingBoxType {
  none,
  driverMap,
  riderMap,
}

List<MapObject<dynamic>> getPlacemarksFromPoints({
  required List<Point> points,
  Point? home,
  Point? destination,
}) {
  final result = <PlacemarkMapObject>[];

  for (final point in points) {
    var imgSource = 'images/dot.png';

    if (point == (home ?? points.first)) {
      imgSource = 'images/home.png';
    } else if (point == (destination ?? points.last)) {
      imgSource = 'images/target.png';
    }

    result.add(PlacemarkMapObject(
      opacity: 1,
      mapId: MapObjectId('${point.hashCode}'),
      point: point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(imgSource),
          scale: 0.5,
        ),
      ),
    ));
  }

  return result;
}

BoundingBox getBoundingBoxOfPoints(
  List<Point> points, {
  BoundingBoxType boundingConstant = BoundingBoxType.none,
}) {
  final latitudes = points.map((e) => e.latitude);
  final maxLat = latitudes.reduce(max);
  final minLat = latitudes.reduce(min);
  final longitude = points.map((e) => e.longitude);
  final maxLong = longitude.reduce(max);
  final minLong = longitude.reduce(min);
  final latDif = maxLat - minLat;
  final longDif = maxLong - minLong;

  Point northEast;
  Point southWest;

  switch (boundingConstant) {
    case BoundingBoxType.none:
      northEast = Point(
        latitude: maxLat + 0.5 * latDif,
        longitude: maxLong + 0.5 * longDif,
      );
      southWest = Point(
        latitude: minLat - 0.5 * latDif,
        longitude: minLong - 0.5 * longDif,
      );
      break;
    case BoundingBoxType.riderMap:
    case BoundingBoxType.driverMap:
      northEast = Point(
        latitude: maxLat + 0.7 * latDif,
        longitude: maxLong + 0.7 * longDif,
      );
      southWest = Point(
        latitude: minLat - 2 * latDif,
        longitude: minLong - 0.7 * longDif,
      );
      break;
  }

  return BoundingBox(
    northEast: northEast,
    southWest: southWest,
  );
}

Future<List<DrivingRoute>> getDrivingRouteBetweenPoints({
  required Point startPoint,
  required Point endPoint,
  List<Point> viaPoints = const [],
  int routesCount = 1,
  double azimuth = 0,
}) async {
  final resultWithSession = YandexDriving.requestRoutes(
    points: [
      RequestPoint(
        point: startPoint,
        requestPointType: RequestPointType.wayPoint,
      ),
      ...viaPoints.map(
        (point) => RequestPoint(
          point: point,
          requestPointType: RequestPointType.viaPoint,
        ),
      ),
      RequestPoint(
        point: endPoint,
        requestPointType: RequestPointType.wayPoint,
      ),
    ],
    drivingOptions: DrivingOptions(
      initialAzimuth: azimuth,
      routesCount: routesCount,
      avoidTolls: true,
    ),
  );

  final result = await resultWithSession.result;

  if (result.error != null) {
    throw Exception('Error: ${result.error}');
  }

  return result.routes!.asMap().values.toList();
}

List<RouteBend> getRouteBends(List<Point> route) {
  final bends = <RouteBend>[];
  final angles = <double>[];

  for (var i = 1; i < route.length; i++) {
    final point = route[i - 1];
    final angle = angleOfTwoPoints(point, route[i]);

    angles.add(angle);

    if (i > 1) {
      bends.add(RouteBend(
        point: point,
        angle: angle,
        angleDifference: angle - angles[i - 2],
      ));
    }
  }

  return bends.where((element) => element.rotation != Rotation.none).toList();
}

IconData iconFromBend(Rotation? bend) {
  switch (bend) {
    case Rotation.none:
      return Icons.straight;
    case Rotation.left:
      return Icons.turn_left;
    case Rotation.halfLeft:
      return Icons.turn_slight_left;
    case Rotation.fullLeft:
      return Icons.u_turn_left;
    case Rotation.halfRight:
      return Icons.turn_slight_right;
    case Rotation.fullRight:
      return Icons.u_turn_right;
    case Rotation.right:
      return Icons.turn_right;
    case null:
      return Icons.straight;
  }
}

PolylineMapObject buildPolyline({
  required DrivingRoute route,
  required int start,
  required int finish,
  required Color color,
  required double strokeWidth,
}) {
  final geometry = route.geometry.sublist(start, finish);

  return PolylineMapObject(
    mapId: MapObjectId('Polyline#${geometry.hashCode}'),
    polyline: Polyline(points: geometry),
    strokeColor: color,
    strokeWidth: strokeWidth,
  );
}

List<MapObject> polylinesFromRoute(
  DrivingRoute route, {
  double strokeWidth = 8,
  bool includeTrafficJam = true,
  Color? routeColor,
}) {
  assert(!(!includeTrafficJam && routeColor != null),
      'When includeTrafficJam option is disabled, route color has to be specified!');

  if (!includeTrafficJam) {
    return [
      PolylineMapObject(
        mapId: MapObjectId('Polyline#${route.geometry.hashCode}'),
        polyline: Polyline(points: route.geometry),
        strokeColor: routeColor!,
        strokeWidth: strokeWidth,
      )
    ];
  }

  final result = <MapObject>[];
  var prevIndex = 0;
  var index = 1;
  var jamType = route.jamSegments.first.jamType;

  while (index < route.jamSegments.length) {
    if (route.jamSegments[index].jamType != jamType) {
      result.add(buildPolyline(
        route: route,
        start: prevIndex,
        finish: index + 1,
        color: colorOfJamSegment(jamType),
        strokeWidth: strokeWidth,
      ));

      jamType = route.jamSegments[index].jamType;
      prevIndex = index;
    }

    index++;
  }

  result.add(buildPolyline(
    route: route,
    start: prevIndex,
    finish: route.geometry.length - 1,
    color: colorOfJamSegment(jamType),
    strokeWidth: strokeWidth,
  ));

  return result;
}

Color colorOfJamSegment(String jamType) {
  switch (jamType) {
    case 'BLOCKED':
    case 'HARD':
      return CustomTheme.renLine;
    case 'LIGHT':
      return CustomTheme.colorBanana;
    case 'FREE':
    case 'UNKNOWN':
    default:
      return CustomTheme.greenLine;
  }
}
