import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/theme.dart';

class WalletActivityItemView extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final double amount;
  final String currency;
  final IconData? icon;
  final String? image;

  const WalletActivityItemView(
      {required this.title,
      required this.dateTime,
      required this.amount,
      required this.currency,
      this.icon,
      this.image,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(!(icon == null && image == null), 'Provide either icon or image!');

    final colorScheme = Theme.of(context).colorScheme;

    return icon == null
        ? ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: colorScheme.onSecondary,
                    borderRadius: const BorderRadius.all(Radius.circular(24))),
                child: Image.asset(
                  image!,
                  color: colorScheme.onTertiary,
                )),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
            ),
            subtitle: Text(
              DateFormat('yyyy.MM.dd  kk:mm').format(dateTime),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
            ),
            trailing: Text(
              NumberFormat.simpleCurrency(name: currency).format(amount),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
            ),
          )
        : ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: CustomTheme.neutralColors.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(24))),
                child: Icon(
                  icon,
                  color: CustomTheme.neutralColors.shade600,
                )),
            title: Text(title, style: Theme.of(context).textTheme.titleMedium),
            subtitle: Text(DateFormat('yyyy.MM.dd  kk:mm').format(dateTime),
                style: Theme.of(context).textTheme.labelMedium),
            trailing: Text(
              NumberFormat.simpleCurrency(name: currency).format(amount),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
  }
}
