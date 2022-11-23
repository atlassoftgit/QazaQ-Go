import 'package:client_shared/utility/extensions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/global_variables.dart';
import '../service/map_mode_cubit.dart';

class CameraService {
  CameraService({
    required this.mapMode,
    this.zoom = 18,
    this.azimuth = 0,
    this.tilt = 0,
    this.isUserInteracting = false,
    this.isTwoD = false,
  }) {
    zoom = mapMode == MapMode.map ? 16 : 19;

    _initialize();
  }

  double zoom;
  double azimuth;
  double tilt;
  bool isUserInteracting;
  bool isTwoD;
  MapMode mapMode;

  late double maxZoom;
  late double minZoom;

  String get dimension => isTwoD ? '2D' : '3D';

  Future<void> _initialize() async {
    maxZoom = 25;
    minZoom = 10;

    updateParameter();
  }

  void updateParameter({
    double? zoomValue,
    double? azimuthValue,
  }) {
    if (zoomValue != null && zoomValue <= maxZoom && zoomValue >= minZoom) {
      zoom = zoomValue;
    }

    if (azimuthValue != null) {
      azimuth = azimuthValue;
    }

    if (zoom > 10 && !isTwoD && mapMode == MapMode.navigator) {
      tilt = (zoom - 10) * 10;
    } else {
      tilt = 0;
    }
  }

  void switchDimensions() {
    isTwoD = !isTwoD;

    updateParameter();
    refreshCamera();
  }

  void zoomIn() {
    updateParameter(zoomValue: zoom + 1);
    refreshCamera();
  }

  void zoomOut() {
    updateParameter(zoomValue: zoom - 1);
    refreshCamera();
  }

  Future<void> refreshCamera() async {
    final cameraPosition = await mapController?.getCameraPosition();

    if (cameraPosition != null) {
      moveCamera(cameraPosition.target);
    }
  }

  Future<void> moveToCurrentPosition() async {
    final currentLocation = await Geolocator.getCurrentPosition();
    isUserInteracting = false;

    moveCamera(currentLocation.toPoint());
  }

  Future<void> moveCamera(Point point) async {
    mapController?.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: point,
          zoom: zoom,
          azimuth: azimuth,
          tilt: tilt,
        ),
      ),
      animation: const MapAnimation(
        type: MapAnimationType.smooth,
        duration: 0.7,
      ),
    );
  }

  @override
  String toString() {
    return 'CameraParameters{' +
        ' zoom: $zoom,' +
        ' azimuth: $azimuth,' +
        ' tilt: $tilt,' +
        ' isUserInteracting: $isUserInteracting,' +
        ' isTwoD: $isTwoD,' +
        '}';
  }
}
