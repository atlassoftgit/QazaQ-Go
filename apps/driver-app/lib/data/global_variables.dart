import 'package:client_shared/utility/azimuth_service.dart';
import 'package:client_shared/utility/navigation_service.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../home/model/camera_service.dart';
import '../home/model/map_engine.dart';
import '../home/service/map_mode_cubit.dart';

final azimuthService = AzimuthService(count: 5);
final mapCameraService = CameraService(mapMode: MapMode.map);
final navigatorCameraService = CameraService(mapMode: MapMode.navigator);
final mapEngine = MapEngine();
final navigationService = NavigationService.initialize();

bool isQazaqNavigatorDefault = false;

YandexMapController? mapController;
