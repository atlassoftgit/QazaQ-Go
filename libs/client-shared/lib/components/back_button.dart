import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';

class RidyBackButton extends StatelessWidget {
  const RidyBackButton({
    Key? key, required this.titleRidyBackButton,
  }) : super(key: key);
  final String titleRidyBackButton;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CupertinoButton(
      onPressed: () => Navigator.pop(context),
      minSize: 0,
      padding: const EdgeInsets.all(0),
      child: Stack(children: [
        Positioned(
          left: -7,
          child: Icon(
            Ionicons.chevron_back,
            color: colorScheme.onBackground,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 16),
          child: Text(
            titleRidyBackButton,
            style: TextStyle(color: colorScheme.onBackground),
          ),
        )
      ]),
    );
  }
}
