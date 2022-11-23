import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:ridy/data/global.dart';
import 'package:ridy/location_selection/location_selection_parent_view.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../location_selection/welcome_card/place_search_sheet_view.dart';
import '../main/bloc/current_location_cubit.dart';

void setCurrentLocation(BuildContext context, Position position) async {
  final geocodeResult = await Nominatim.reverseSearch(
    lat: position.latitude,
    lon: position.longitude,
    nameDetails: true,
  );
  final fullLocation = geocodeResult.toFullLocation();
  try {
    context.read<CurrentLocationCubit>().updateLocation(
          FullLocation(
            latlng: fullLocation.latlng,
            address: getAddress(
              fullLocation.address,
            ),
            title: fullLocation.title,
          ),
        );
  } catch (error) {
    rethrow;
  }
}

String getAddress(String str) {
  var list = str.split(', ');
  int comma = list.length;
  String street = list[1].substring(0, list[1].length - 6);

  if (comma == 5) {
    return '${list[1].split(' ').last} $street ${list[0]}';
  }
  return str;
}

void moveToCurrentPosition() {
  Geolocator.getCurrentPosition().then((value) async {
    mapController?.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: value.latitude,
            longitude: value.longitude,
          ),
          zoom: 18,
        ),
      ),
      animation: const MapAnimation(duration: 0.5),
    );
  });
}

Future<void> init(Future<SearchSessionResult> result, SearchSession session,
    List<SearchSessionResult> results, String? address) async {
  await handleResult(await result, session, results, address);
}

Future<void> handleResult(SearchSessionResult result, SearchSession session,
    List<SearchSessionResult> results, String? address) async {
  if (result.error != null) {
    return;
  }
  
  results.add(result);

  if (await session.hasNextPage()) {
    address = null;

    await handleResult(await session.fetchNextPage(), session, results, address);
  }
}

List<String> getAddresses(List<SearchSessionResult> results) {
  final list = <String>[];
  if (results.isEmpty) {
    list.add('Nothing found');
  }

  for (var r in results) {
    r.items!.asMap().forEach((i, item) {
      list.add(item.toponymMetadata!.address.formattedAddress);
    });
  }
  return list;
}

String getTrueAddress(String str) {
  var list = str.split(',');
  int comma = list.length;
  if (comma > 3) {
    return '${list[2].trim()}, ${list[3].trim()}';
  } else if (comma == 3) {
    return '${list[1].trim()}, ${list[2].trim()}';
  } else if (comma == 2) {
    return '${list[0].trim()}, ${list[1].trim()}';
  }
  return str;
}
