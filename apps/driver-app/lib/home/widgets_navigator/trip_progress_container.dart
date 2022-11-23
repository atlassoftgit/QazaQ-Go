import 'package:client_shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/images.dart';
import '../../data/global_variables.dart';
import '../service/map_objects_cubit.dart';

class TripProgressContainer extends StatelessWidget {
  const TripProgressContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconWidth = 45.0;

    return BlocBuilder<MapObjectsCubit, List<MapObject>>(builder: (context, state) {
      final colorScheme = Theme.of(context).colorScheme;
      final style = Theme.of(context).textTheme.titleMedium!.copyWith(
            color: colorScheme.onSecondaryContainer,
          );
      final drivingWeight = navigationService.route.metadata.weight;
      final fullWidth = MediaQuery.of(context).size.width - 50 - iconWidth;

      var format = DateFormat("hh:mm");
      var date = DateTime.now().millisecondsSinceEpoch;

      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 4),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          mapEngine.currentStreet ?? '',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colorScheme.onSecondaryContainer,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        drivingWeight.distance.text,
                        style: style,
                      ),
                      Text(
                        format.format(DateTime.fromMillisecondsSinceEpoch(date)),
                        style: style,
                      ),
                      Text(
                        navigationService.route.metadata.weight.timeWithTraffic.text,
                        style: style,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 15,
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(
                        colors: const [
                          CustomTheme.neutralColors,
                          CustomTheme.greenLine,
                        ],
                        stops: [mapEngine.progress, mapEngine.progress],
                      ),
                    ),
                  ),
                  Positioned(
                    left: fullWidth * mapEngine.progress,
                    child: Image.asset(
                      Images.arrowHorizontal,
                      width: iconWidth,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
