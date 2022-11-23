import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_shared/theme/theme.dart';

class SheetTitleView extends StatelessWidget {
  final String title;
  final Function()? closeAction;
  final Color? colorBackButton;

  const SheetTitleView({required this.title, this.closeAction, this.colorBackButton,  Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Stack(
          children: [
            if (closeAction != null)
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: closeAction,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: colorBackButton ?? CustomTheme.neutralColors.shade800,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.close,
                    color: colorBackButton ?? CustomTheme.neutralColors.shade800,
                    size: 18,
                  ),
                ),
              ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: colorScheme.onSecondaryContainer,
                    ),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 4),
          child: Divider(
            color: CustomTheme.primaryColors.shade300,
          ),
        )
      ],
    );
  }
}
