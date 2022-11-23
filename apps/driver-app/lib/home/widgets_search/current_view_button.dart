import 'package:flutter/material.dart';

import '../../data/images.dart';
import '../../data/global_variables.dart';

class CurrentViewButton extends StatelessWidget {
  const CurrentViewButton({this.size = 50, Key? key,}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    final cameraService = mapEngine.cameraService;

    return Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: cameraService.moveToCurrentPosition
            ,
            icon: Padding(
              padding: const EdgeInsets.only(right: 5, top: 5),
              child: Image.asset(
                Images.iconNavigator,
                scale: 1.2,
              ),
            ),
          ),
        );
  }
}
