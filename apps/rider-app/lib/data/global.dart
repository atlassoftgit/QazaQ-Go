import 'package:client_shared/utility/azimuth_service.dart';
import 'package:client_shared/utility/navigation_service.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

final navigationService = NavigationService.initialize();
final azimuthService = AzimuthService(count: 5);
YandexMapController? mapController;

