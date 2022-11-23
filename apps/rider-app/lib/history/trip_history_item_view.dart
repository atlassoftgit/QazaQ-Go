import 'package:client_shared/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripHistoryItemView extends StatelessWidget {
  final String id;
  final String title;
  final DateTime dateTime;
  final String currency;
  final double price;
  final bool isCanceled;
  final Function(String) onPressed;

  const TripHistoryItemView(
      {required this.id,
      required this.title,
      required this.dateTime,
      required this.currency,
      required this.price,
      required this.isCanceled,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => onPressed(id),
      child: Container(
        decoration: BoxDecoration(
            color: CustomTheme.neutralColors.shade100,
            borderRadius: BorderRadius.circular(17)),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 2),
                    Text(DateFormat('yyyy.MM.dd  kk:mm').format(dateTime),
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      NumberFormat.simpleCurrency(name: currency).format(price),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (isCanceled)
                      Text(
                        "Canceled",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(0xffb20d0e)),
                      )
                  ],
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 100,
                  child: Image.asset(
                    'images/${getTaxiOption(title)}_option.png',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getTaxiOption(String title) {
    switch (title) {
      case 'Комфорт+':
        return 'business';
      case 'Комфорт':
        return 'comfort';
    }
    return 'lite';
  }
}
