import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:client_shared/theme/theme.dart';

class LightColoredButton extends StatelessWidget {
  final IconData? icon;
  final String? iconString;
  final String text;
  final Function()? onPressed;
  final Color? colorOption, colorText;

  const LightColoredButton(
      {this.icon,
      this.iconString,
      required this.text,
      required this.onPressed,
      this.colorText,
      Key? key,
      this.colorOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: colorText ?? colorScheme.onTertiaryContainer,
                  ),
            ),
            const SizedBox(width: 8),
            if (icon != null)
              Icon(
                icon,
                color: colorOption ?? CustomTheme.primaryColors.shade600,
              ),
            if (iconString != null)
              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(iconString!),
              ),
          ],
        ));
  }
}
