import 'package:flutter/material.dart';

class NoticeBar extends StatelessWidget {
  final String title;
  const NoticeBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Color(0x14000000), offset: Offset(0, -3), blurRadius: 25)
          ]),
      child: SafeArea(
          top: false,
          minimum: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: colorScheme.onSecondary
            ),
            textAlign: TextAlign.center,
          )),
    );
  }
}
