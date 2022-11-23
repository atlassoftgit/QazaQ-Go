import 'package:flutter/foundation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@immutable
class LocationData {
  const LocationData({
    required this.point,
    required this.azimuth,
  });

  factory LocationData.empty() => const LocationData(
        point: Point(
          longitude: 0,
          latitude: 0,
        ),
        azimuth: 0,
      );

  final Point point;
  final double azimuth;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationData &&
          runtimeType == other.runtimeType &&
          point == other.point &&
          azimuth == other.azimuth);

  @override
  int get hashCode => point.hashCode ^ azimuth.hashCode;

  @override
  String toString() {
    return 'LocationData{coordinate: $point, azimuth: $azimuth,}';
  }

  LocationData copyWith({
    Point? point,
    double? azimuth,
  }) {
    return LocationData(
      point: point ?? this.point,
      azimuth: azimuth ?? this.azimuth,
    );
  }
}
