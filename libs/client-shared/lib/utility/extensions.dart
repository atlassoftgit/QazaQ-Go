import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:yandex_mapkit/yandex_mapkit.dart';

extension LatLongCasting on latlong.LatLng {
  Point toPoint() {
    return Point(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension PositionCasting on Position {
  Point toPoint() {
    return Point(
      latitude: latitude,
      longitude: longitude,
    );
  }
}