import 'package:client_shared/components/sheet_title_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/global_variables.dart';
import '../../data/images.dart';
import '../../generated/l10n.dart';
import '../../graphql/generated/graphql_api.dart';
import '../service/map_mode_cubit.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    required this.order,
    Key? key,
  }) : super(key: key);

  final CurrentOrderMixin order;

  Future<void> _openMapsSheet(context, MapModeCubit mapMode, CurrentOrderMixin order) async {
    final availableMaps = await MapLauncher.installedMaps;

    String title = S.of(context).navigate_to_pickup_point;

    Coords coords = Coords(order.points.first.lat, order.points.first.lng);
    if (order.status != OrderStatus.driverAccepted && order.status != OrderStatus.arrived) {
      title = S.of(context).navigate_to_drop_off_point;
      coords = Coords(order.points.last.lat, order.points.last.lng);
    }

    if (isQazaqNavigatorDefault) {
      mapMode.switchToNavigator();
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;

        return SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            children: [
              SheetTitleView(
                colorBackButton: colorScheme.onSecondaryContainer,
                title: S.of(context).choose_an_app_to_navigate_with,
                closeAction: () {
                  Navigator.pop(context);
                },
              ),
              SingleChildScrollView(
                child: Wrap(
                  children: <Widget>[
                    const Divider(),
                    ListTile(
                      onTap: () {
                        isQazaqNavigatorDefault = true;
                        mapMode.switchToNavigator();

                        Navigator.pop(context);
                      },
                      title: Text(
                        'QazaQ GO',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: colorScheme.onSecondaryContainer,
                            ),
                      ),
                      leading: Image.asset(
                        Images.logo,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    const Divider(),
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () {
                          map.showMarker(
                            coords: coords,
                            title: title,
                          );

                          Navigator.pop(context);
                        },
                        title: Text(
                          map.mapName,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: colorScheme.onSecondaryContainer,
                              ),
                        ),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final mapMode = context.read<MapModeCubit>();

    return Row(
      children: [
        const Spacer(),
        FloatingActionButton.extended(
          heroTag: 'navigateFab',
          onPressed: () => _openMapsSheet(context, mapMode, order),
          elevation: 0,
          backgroundColor: colorScheme.secondary,
          label: Text(
            S.of(context).order_status_action_navigate,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: colorScheme.onSecondaryContainer),
          ),
          icon: const Icon(Ionicons.navigate),
        ),
      ],
    ).pSymmetric(v: 12, h: 16);
  }
}
