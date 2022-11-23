import 'package:client_shared/components/ridy_sheet_view.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

import '../../config.dart';
import '../../data/images.dart';
import '../../generated/l10n.dart';
import '../../graphql/generated/graphql_api.graphql.dart';

class OrderInvoiceView extends StatelessWidget {
  final CurrentOrderMixin order;
  final Widget button;
  final QueryResult? result;

  const OrderInvoiceView({
    required this.order,
    required this.button,
    required this.result,
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RidySheetView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SheetTitleView(title: S.of(context).payment_info),
          Text(
            S.of(context).waiting_for_rider_payment,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: colorScheme.onSecondaryContainer,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            S.of(context).you_can_also_receive_cash_instead_of_online_payment,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: colorScheme.onSecondaryContainer,
                ),
          ),
          const SizedBox(height: 8),
          Center(
            child: UserAvatarView(
              urlPrefix: serverUrl,
              url: order.rider.media?.address,
              cornerRadius: 12,
              size: 60,
              image: Images.iconUser,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              "${order.rider.firstName ?? ""} ${order.rider.lastName ?? ""}",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      order.service.name,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: colorScheme.onSecondaryContainer,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.simpleCurrency(
                        name: order.currency,
                      ).format(order.costBest),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: colorScheme.onSecondaryContainer,
                          ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      S.of(context).tip,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: colorScheme.onSecondaryContainer,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.simpleCurrency(
                        name: order.currency,
                      ).format(0),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: colorScheme.onSecondaryContainer,
                          ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1.5,
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).subtotal,
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: colorScheme.onSecondaryContainer,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.simpleCurrency(
                        name: order.currency,
                      ).format(order.costBest),
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: colorScheme.onSecondaryContainer,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          button,
        ],
      ),
    );
  }
}
