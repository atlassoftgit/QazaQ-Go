import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';
import 'package:client_shared/components/marker_new.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddressLocationSelectionView extends StatefulWidget {
  final FullLocation? defaultLocation;

  const AddressLocationSelectionView(this.defaultLocation, {Key? key})
      : super(key: key);

  @override
  State<AddressLocationSelectionView> createState() =>
      _AddressLocationSelectionViewState();
}

class _AddressLocationSelectionViewState
    extends State<AddressLocationSelectionView> {
  final MapController mapController = MapController();
  String? address;
  late StreamSubscription<MapEvent> subscription;

  @override
  void initState() {
    address ??= widget.defaultLocation?.address;
    mapController.onReady.then((value) {
      subscription =
          mapController.mapEventStream.listen((MapEvent mapEvent) async {
        if (mapEvent is MapEventMoveStart) {
          setState(() {
            address = null;
          });
        } else if (mapEvent is MapEventMoveEnd) {
          final reverseSearchResult = await Nominatim.reverseSearch(
              lat: mapController.center.latitude,
              lon: mapController.center.longitude,
              nameDetails: true);
          final fullLocation = reverseSearchResult.convertPlaceToFullLocation();
          setState(() {
            address = fullLocation.address;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        YandexMap(
          nightModeEnabled:
              MediaQuery.of(context).platformBrightness == Brightness.dark,
        ),
        MarkerNew(address: address).centered(),
      ],
    );
  }
}
