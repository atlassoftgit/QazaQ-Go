// MapBox Configuration (Only if Map Provider is set to mapBox)
import 'package:client_shared/map_providers.dart';
import 'package:latlong2/latlong.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

String serverIP = "atlas-soft.site";
String appName = "QazaQ Go";

MapProvider mapProvider = MapProvider.yandex;
String mapBoxAccessToken =
    "pk.eyJ1IjoiYXRsYXNzb2Z0MDciLCJhIjoiY2wxbTFpeThxMDE5djNqcGNyNnYzaTJhbiJ9.QX5D5xMnXO0u759DS30wTA";
String mapBoxUserId = "atlassoft07";
String mapBoxTileSetId = "cl1t0uw20000814mpxng6lfec";

YandexGeocoder geocoder =
    YandexGeocoder(apiKey: '4d238889-a0c8-4289-8d1a-52d7a4ecf645');

String loginTermsAndConditionsUrl = "";

String defaultCurrency = "RUB";
String defaultCountryCode = "+7";
const List<double> tipPresets = [10, 20, 50];
LatLng fallbackLocation = LatLng(42.890527, 74.615245);
const constantUpdateThreshold = 0.0001;
const constantReachThreshold = 0.0015;

// Menu website url
String? websiteUrl = "https://atlassoft.kg/";
