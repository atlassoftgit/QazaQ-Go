import 'package:client_shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TripHistoryItemView extends StatelessWidget {
  final String id;
  final String title;
  final DateTime dateTime;
  final String currency, titleCanceled, image;
  final double price;
  final bool isCanceled;
  final Function(String) onPressed;

  const TripHistoryItemView(
      {required this.id,
      required this.title,
      required this.image,
      required this.dateTime,
      required this.currency,
      required this.price,
      required this.isCanceled,
      required this.onPressed,
      required this.titleCanceled,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () => onPressed(id),
      title: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 105,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: CustomTheme.neutralColors.shade200,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          image,
                          width: 105,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.comfortaa(
                        textStyle:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: colorScheme.onSecondaryContainer,
                                ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      DateFormat('yyyy.MM.dd  kk:mm').format(dateTime),
                      style: GoogleFonts.comfortaa(
                        textStyle:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: colorScheme.onSecondaryContainer,
                                ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      NumberFormat.simpleCurrency(name: currency).format(price),
                      style: GoogleFonts.comfortaa(
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: colorScheme.onSecondaryContainer),
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (isCanceled)
                      Text(
                        titleCanceled,
                        style: GoogleFonts.comfortaa(
                          textStyle:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: colorScheme.onError,
                                  ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
