import 'dart:async';
import 'dart:io';

import 'package:client_shared/config.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:ridy/data/images.dart';
import 'package:ridy/location_selection/welcome_card/place_confirm_sheet_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart' hide Point;
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../generated/l10n.dart';

class PlaceSearchSheetView extends StatelessWidget {
  final FullLocation? currentLocation;

  const PlaceSearchSheetView(this.currentLocation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuggestionsCubit(),
      child: PlaceSearchSheetViewChild(currentLocation),
    );
  }
}

class PlaceSearchSheetViewChild extends StatefulWidget {
  final FullLocation? currentLocation;

  const PlaceSearchSheetViewChild(this.currentLocation, {Key? key}) : super(key: key);

  @override
  State<PlaceSearchSheetViewChild> createState() => _PlaceSearchSheetViewChildState();
}

class _PlaceSearchSheetViewChildState extends State<PlaceSearchSheetViewChild> {
  List<FullLocation?> selectedLocations = [];
  final List<SuggestSessionResult> results = [];
  List<TextEditingController> textEditingControllers = <TextEditingController>[];
  var list = <FullLocation>[];
  int selectedIndex = 1;

  @override
  initState() {
    selectedLocations = [null, null];
    textEditingControllers
      ..add(TextEditingController())
      ..add(TextEditingController());
    super.initState();
  }

  @override
  void dispose() {
    for (final controller in textEditingControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            splashRadius: 20,
          )
        ]),
        Container(
          padding: const EdgeInsets.only(
            top: 6,
            bottom: 6,
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomTheme.neutralColors.shade100,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...selectedLocations.mapIndexed((location, index) {
                      final suggestionsCubit = context.read<SuggestionsCubit>();
                      return Column(
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Image.asset(
                                    index == 0
                                        ? Images.iconStartPoint
                                        : (index == selectedLocations.length - 1
                                            ? Images.iconStopPoint
                                            : Images.iconEndPoint),
                                    fit: BoxFit.fill,
                                  ).p4(),
                                ),
                                Expanded(
                                  child: TextField(
                                    autofocus: widget.currentLocation == null ? index == 0 : index == 1,
                                    controller: textEditingControllers[index],
                                    onTap: (() {
                                      selectedIndex = index;
                                    }),
                                    onChanged: (value) async {
                                      if (value.isEmptyOrNull && suggestionsCubit.state.suggestions.isNotEmpty) {
                                        suggestionsCubit.clearSuggestions();
                                        return;
                                      }

                                      _suggest(value);
                                      suggestionsCubit.showSuggestions(list);
                                    },
                                    decoration: noBorderInputDecoration.copyWith(
                                      hintText: index == 0
                                          ? S.of(context).hint_current_location
                                          : (index < selectedLocations.length - 1
                                              ? S.of(context).hint_add_stop
                                              : S.of(context).hint_your_destination),
                                      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: index == selectedLocations.length - 1
                                                ? CustomTheme.primaryColors
                                                : CustomTheme.neutralColors,
                                          ),
                                    ),
                                  ),
                                ),
                                CupertinoButton(
                                  onPressed: () async {
                                    final result = await showBarModalBottomSheet<FullLocation>(
                                      isDismissible: false,
                                      context: context,
                                      enableDrag: false,
                                      builder: (context) {
                                        return PlaceConfirmSheetView(widget.currentLocation);
                                      },
                                    );

                                    if (result != null) {
                                      setLocation(result, index);
                                    }
                                  },
                                  minSize: 0,
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(Images.iconMap),
                                      ),
                                      const Text(
                                        'КАРТА',
                                        style:
                                            TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                if (index == selectedLocations.length - 1 && selectedLocations.length < 5) ...[
                                  const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: VerticalDivider(color: Colors.black),
                                  ),
                                  CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedLocations = selectedLocations.followedBy([null]).toList();
                                        textEditingControllers = textEditingControllers
                                            .followedBy([TextEditingController(text: location?.address)]).toList();
                                      });
                                    },
                                    padding: const EdgeInsets.all(4),
                                    minSize: 0,
                                    child: const Icon(
                                      Icons.add,
                                      color: CustomTheme.neutralColors,
                                    ),
                                  ),
                                ],
                                if (index > 0 && index < selectedLocations.length - 1) ...[
                                  const Padding(
                                    padding: EdgeInsets.all(4),
                                    child: VerticalDivider(color: Colors.black),
                                  ),
                                  CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedLocations = [selectedLocations.first, ...selectedLocations.sublist(2)];
                                        textEditingControllers = [
                                          textEditingControllers.first,
                                          ...textEditingControllers.sublist(2)
                                        ];
                                      });
                                    },
                                    padding: const EdgeInsets.all(4),
                                    minSize: 0,
                                    child: const Icon(
                                      Icons.clear,
                                      color: CustomTheme.neutralColors,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          if (index < selectedLocations.length - 1)
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 35,
                                right: 5,
                              ),
                              child: Divider(),
                            ),
                        ],
                      );
                    }),
                  ],
                ),
              )
            ],
          ).p4(),
        ).pOnly(right: 12, left: 12, bottom: 8),
        Container(
          height: 8,
          decoration: BoxDecoration(color: Colors.grey.shade50, boxShadow: const [
            BoxShadow(color: Color(0x0f000000), offset: Offset(0, 2), blurRadius: 12, spreadRadius: 0)
          ]),
        ),
        Container(
          height: 10,
          color: Colors.grey.shade50,
        ),
        BlocBuilder<SuggestionsCubit, SuggestionsState>(builder: (context, state) {
          if (state.suggestions.isEmpty) {
            return const SizedBox();
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: state.suggestions.length,
                itemBuilder: ((context, index) {
                  return LocationSearchResultItem(
                    location: state.suggestions[index],
                    isHistory: false,
                    onSelected: (location) => setLocation(location, selectedIndex),
                  );
                }),
              ),
            );
          }
        })
      ],
    );
  }

  void setLocation(FullLocation location, int index) {
    selectedLocations[index] = location;
    if (selectedLocations.withoutFirst().toList().indexWhere((element) => element == null) < 0) {
      if (selectedLocations[0] == null && widget.currentLocation == null) {
        showPickupLocationCanNotBeEmptyDialog(context);
        return;
      }
      final List<FullLocation> locations = [
        selectedLocations[0] ?? widget.currentLocation!,
        ...selectedLocations.whereType<FullLocation>()
      ];

      Navigator.pop(context, locations);
      return;
    }
    setState(() {
      selectedLocations[index] = location;
      textEditingControllers[index].text = location.address;
    });
  }

  void showPickupLocationCanNotBeEmptyDialog(BuildContext context) async {
    final location = await Geolocator.checkPermission();
    FirebaseAnalytics.instance
        .logEvent(name: "location_not_found", parameters: {"permission": location, "OS": Platform.operatingSystem});
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).title_location_error),
            content: Text(S.of(context).body_location_error),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(), child: const Text("OK", textAlign: TextAlign.end))
            ],
          );
        });
  }

  Future<void> _suggest(String query) async {
    setState(() => list = <FullLocation>[]);

    final resultWithSession = YandexSuggest.getSuggestions(
      text: query,
      boundingBox: const BoundingBox(
        northEast: Point(latitude: 43.448337, longitude: 77.176698),
        southWest: Point(latitude: 43.117582, longitude: 76.605677),
      ),
      suggestOptions: SuggestOptions(
        suggestType: SuggestType.unspecified,
        userPosition: Point(
          latitude: fallbackLocation.latitude,
          longitude: fallbackLocation.longitude,
        ),
      ),
    );
    await _init(resultWithSession.result);
  }

  Future<void> _init(Future<SuggestSessionResult> result) async {
    await _handleResult(await result);
  }

  Future<void> _handleResult(SuggestSessionResult result) async {
    results.clear();
    if (result.error != null) {
      return;
    }

    setState(() => results.add(result));
    for (final result in results) {
      for (final item in result.items!) {
        list.add(
          FullLocation(
            latlng: LatLng(fallbackLocation.latitude, fallbackLocation.longitude),
            address: item.subtitle ?? item.displayText,
            title: item.title,
          ),
        );
      }
    }
  }
}

class LocationSearchResultItem extends StatelessWidget {
  final FullLocation location;
  final bool isHistory;
  final Function(FullLocation) onSelected;

  const LocationSearchResultItem({required this.location, required this.isHistory, required this.onSelected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late GeocodeResponse response;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        var address = location.address;
        var searchAddress = 'Алматы, Казахстан';

        if (address.contains(' · ')) {
          address = location.address.substring(location.address.lastIndexOf(' · ') + 3).trim();
        }

        if (address.contains(RegExp(r'[0-9]'))) {
          searchAddress = '${location.title}, $address, $searchAddress';
        } else {
          searchAddress = '${location.title}, $searchAddress';
        }

        response = await geocoder.getGeocode(
          GeocodeRequest(
            geocode: AddressGeocode(address: searchAddress),
            lang: Lang.ru,
          ),
        );

        if (response.firstPoint == null) return;

        final result = await showBarModalBottomSheet<FullLocation>(
          isDismissible: false,
          context: context,
          enableDrag: false,
          builder: (context) {
            return PlaceConfirmSheetView(
              FullLocation(
                title: location.title,
                address: location.address,
                latlng: LatLng(
                  response.firstPoint!.latitude,
                  response.firstPoint!.longitude,
                ),
              ),
            );
          },
        );

        if (result == null) return;

        onSelected(result);
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                isHistory ? Ionicons.time : Ionicons.compass,
                color: CustomTheme.neutralColors.shade400,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ).pOnly(bottom: 4),
                    Text(
                      location.address,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ).pOnly(left: 16),
              )
            ],
          ).pSymmetric(h: 16, v: 8),
          const Divider()
        ],
      ),
    );
  }
}

const noBorderInputDecoration = InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.all(8),
    filled: false,
    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none));

class FullLocation {
  String title;
  String address;
  LatLng latlng;

  FullLocation({required this.latlng, required this.address, required this.title});
}

extension ConvertToFullLocation on Place {
  FullLocation convertPlaceToFullLocation() {
    return FullLocation(latlng: LatLng(lat, lon), address: displayName, title: nameDetails?['name'] ?? "Unknown");
  }
}

class SuggestionsCubit extends Cubit<SuggestionsState> {
  SuggestionsCubit() : super(SuggestionsState([]));

  void clearSuggestions() => emit(SuggestionsState([]));

  void showSuggestions(List<FullLocation> suggestions) => emit(SuggestionsState(suggestions));
}

class SuggestionsState {
  List<FullLocation> suggestions = [];

  SuggestionsState(this.suggestions);
}
