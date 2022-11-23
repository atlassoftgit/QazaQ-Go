import 'package:yandex_mapkit/yandex_mapkit.dart';

enum Rotation {
  none,
  left,
  halfLeft,
  fullLeft,
  right,
  halfRight,
  fullRight,
}

class RouteBend {
  RouteBend({
    required this.point,
    required this.angle,
    required this.angleDifference,
}) {
    if (angleDifference > 90) {
      angleDifference = angleDifference - 180;
    }
    if (angleDifference < -90) {
      angleDifference = angleDifference + 180;
    }
  }

  final Point point;
  final double angle;
  double angleDifference;
  bool hundredNotificationPlayed = false;
  bool rotationNotificationPlayed = false;

  bool get upwards => angleDifference > 0;

  Rotation get rotation {
    if (angleDifference > 30 && angleDifference < 60) {
      return Rotation.halfLeft;
    }
    if (angleDifference > 60 && angleDifference < 90) {
      return Rotation.left;
    }
    if (angleDifference > 90) {
      return Rotation.fullLeft;
    }
    if (angleDifference < -30 && angleDifference > -60) {
      return Rotation.halfRight;
    }
    if (angleDifference < -60 && angleDifference > -90) {
      return Rotation.right;
    }
    if (angleDifference < -90) {
      return Rotation.fullRight;
    }
    return Rotation.none;
  }

  @override
  String toString() {
    return 'RouteRotation{point: $point, angle: $angle, angleDifference: $angleDifference}';
  }
}