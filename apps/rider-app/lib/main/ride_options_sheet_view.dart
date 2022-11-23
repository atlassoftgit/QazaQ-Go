import 'package:client_shared/components/ride_option_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:ridy/generated/l10n.dart';

class RideOptionsSheetView extends StatelessWidget {
  const RideOptionsSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetTitleView(
              title: S.of(context).ride_options,
              closeAction: () => Navigator.pop(context),
            ),
            RideOptionItem(
                icon: Ionicons.time,
                text: S.of(context).option_wait_time,
                onPressed: () =>
                    Navigator.pop(context, RideOptionsResult.waitTime)),
            const SizedBox(height: 8),
            RideOptionItem(
                icon: Ionicons.pricetag,
                text: S.of(context).option_coupon_code,
                onPressed: () =>
                    Navigator.pop(context, RideOptionsResult.couponCode)),
            const SizedBox(height: 8),
            RideOptionItem(
                icon: Ionicons.gift,
                text: S.of(context).option_gift_card,
                onPressed: () =>
                    Navigator.pop(context, RideOptionsResult.giftCode)),
            const SizedBox(height: 8),
            RideOptionItem(
                icon: Ionicons.close,
                text: S.of(context).option_cancel_ride,
                onPressed: () =>
                    Navigator.pop(context, RideOptionsResult.cancel)),
          ],
        ));
  }
}

enum RideOptionsResult { none, waitTime, couponCode, giftCode, cancel }
