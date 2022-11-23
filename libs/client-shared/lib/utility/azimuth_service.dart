import 'package:velocity_x/velocity_x.dart';
import 'functions.dart' as functions;

const double azimuthThresholdDegree = 15;

class AzimuthService {
  AzimuthService({
    required this.count,
  });

  final int count;
  List<double> data = [];
  double _value = 0;

  double get average => data.average() ?? 0;

  double get median => functions.median(data) ?? 0;

  double get value => _value;

  void addAzimuth(double element) {
    if (data.length == count) {
      data.removeLast();
    }

    data.insert(0, -element);

    if ((median - _value).abs() > azimuthThresholdDegree) {
      _value = median;
    }
  }

  @override
  String toString() {
    return 'AzimuthCollection{ count: $count, data: $data,}';
  }
}
