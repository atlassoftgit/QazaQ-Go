import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:client_shared/utility/functions.dart';
import 'package:client_shared/utility/route_rotation.dart';
import 'package:client_shared/utility/yandex_map_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/global_variables.dart';
import '../../data/sounds.dart';
import '../service/map_objects_cubit.dart';

class NextBendContainer extends StatefulWidget {
  const NextBendContainer({Key? key}) : super(key: key);

  @override
  State<NextBendContainer> createState() => _NextBendContainerState();
}

class _NextBendContainerState extends State<NextBendContainer> {
  late AssetsAudioPlayer _assetsAudioPlayer;
  bool _isPlayerActive = true;

  @override
  initState() {
    super.initState();

    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
  }

  Future<void> _playSounds(String sound) async {
    _isPlayerActive = false;
    await _assetsAudioPlayer.open(
      Audio(sound)
    );

    Future.delayed(const Duration(seconds: 15), () {
      _isPlayerActive = true;
    });
  }

  void _managePlayer(RouteBend bend, double distance) {
    if (distance < 130 && distance > 90) {
      switch (bend.rotation) {
        case Rotation.none:
          break;
        case Rotation.left:
        case Rotation.halfLeft:
        case Rotation.fullLeft:
          _playSounds(Sounds.leftHundred);
          break;
        case Rotation.right:
        case Rotation.halfRight:
        case Rotation.fullRight:
          _playSounds(Sounds.rightHundred);
          break;
      }
    }

    if (distance < 40) {
      switch (bend.rotation) {
        case Rotation.none:
          break;
        case Rotation.left:
        case Rotation.halfLeft:
        case Rotation.fullLeft:
          _playSounds(Sounds.left);
          break;
        case Rotation.right:
        case Rotation.halfRight:
        case Rotation.fullRight:
          _playSounds(Sounds.right);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapObjectsCubit, List<MapObject>>(
      builder: (context, state) {
        final nextBend = navigationService.nextBend;
        final point = nextBend?.point ?? navigationService.destinationPoint;
        final distance = distanceBetweenTwoPointsInMeters(
          navigationService.userLocation.point,
          point,
        );

        print('nexBend: $nextBend');
        print('distance: $distance');
        print('_isPlayerActive: $_isPlayerActive');

        if (nextBend != null && _isPlayerActive) {
          _managePlayer(nextBend, distance);
        }

        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  child: Icon(
                    iconFromBend(nextBend?.rotation),
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${distance.toStringAsFixed(0)} м',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
