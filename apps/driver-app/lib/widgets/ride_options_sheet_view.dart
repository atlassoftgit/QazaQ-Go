import 'package:client_shared/components/sheet_title_view.dart';
import 'package:client_shared/components/ride_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../generated/l10n.dart';

class RideOptionsSheetView extends StatelessWidget {
  const RideOptionsSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetTitleView(
              colorBackButton: colorScheme.onSecondaryContainer,
              title: S.of(context).ride_options,
              closeAction: () => Navigator.pop(context),
            ),
            RideOptionItem(
                icon: Ionicons.close,
                text: S.of(context).cancel_ride,
                onPressed: () =>
                    Navigator.pop(context, RideOptionsResult.cancel)),
          ],
        ));
  }
}

enum RideOptionsResult { none, cancel }
