import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:client_shared/components/sheet_title_view.dart';

import '../generated/l10n.dart';

class EnterCouponCodeSheetView extends StatefulWidget {
  const EnterCouponCodeSheetView({Key? key}) : super(key: key);

  @override
  State<EnterCouponCodeSheetView> createState() =>
      _EnterCouponCodeSheetViewState();
}

class _EnterCouponCodeSheetViewState extends State<EnterCouponCodeSheetView> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetTitleView(
              title: S.of(context).coupon_textfield_hint,
              closeAction: () => Navigator.pop(context),
            ),
            Text(
              S.of(context).title_coupon,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => setState(() {
                code = value;
              }),
              decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(Ionicons.pricetag),
                  hintText: S.of(context).coupon_heading),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: code.isEmpty
                            ? null
                            : () {
                                Navigator.pop(context, code);
                              },
                        child:  Text(S.of(context).invoice_apply_coupon_action))),
              ],
            )
          ],
        ));
  }
}
