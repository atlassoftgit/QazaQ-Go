import 'package:flutter/material.dart';

import 'package:client_shared/theme/theme.dart';

class RidySheetView extends StatelessWidget {
  final Widget child;

  const RidySheetView({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
        decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, -3),
                  blurRadius: 25)
            ]),
        child: SafeArea(
            top: false,
            bottom: MediaQuery.of(context).size.width <
                CustomTheme.tabletBreakpoint,
            minimum: const EdgeInsets.all(16),
            child: child));
  }
}
