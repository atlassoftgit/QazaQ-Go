import 'dart:math';

import 'package:yandex_mapkit/yandex_mapkit.dart';

num power2(num x) => pow(x, 2);

int mpsToKph(double mps) => (mps * 3.6).round();

double radianToDegree(double radian) => radian * 180 / pi;

double distanceBetweenTwoPoints(Point first, Point second) =>
    sqrt((power2(first.longitude - second.longitude) + (power2(first.latitude - second.latitude))));

double angleOfTwoPoints(Point first, Point second) =>
    radianToDegree(atan((second.latitude - first.latitude) / (second.longitude - first.longitude)));

double distanceBetweenTwoPointsInMeters(Point first, Point second) {
  final degree = distanceBetweenTwoPoints(first, second);

  return degree * 111000;
}

double distanceBetweenManyPoints(List<Point> points) {
  var total = 0.0;

  for (var i = 1; i < points.length; i++) {
    total += distanceBetweenTwoPointsInMeters(points[i - 1], points[i]);
  }

  return total;
}

bool isPointReached(
  Point current,
  Point destination, {
  required double threshold,
}) =>
    distanceBetweenTwoPoints(current, destination) <= threshold;

double? median(List<double> list) {
  if (list.isEmpty) {
    return null;
  }

  final clonedList = <double>[];
  clonedList
    ..addAll(list)
    ..sort();

  double median;
  int middle = list.length ~/ 2;

  if (list.length % 2 == 1) {
    median = clonedList[middle];
  } else {
    median = (clonedList[middle - 1] + clonedList[middle]) / 2;
  }

  return median;
}
