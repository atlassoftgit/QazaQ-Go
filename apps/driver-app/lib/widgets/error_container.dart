import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../main.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    required this.title,
    required this.message,
    this.image,
    Key? key,
  }) : super(key: key);

  final String? image;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null) ...[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset(image!, color: Colors.deepOrangeAccent),
          ),
        ],
        const SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: colorScheme.onSecondaryContainer,
              ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            message,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: colorScheme.onSecondaryContainer,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              RestartWidget.restartApp(context);
            },
            child: Text(
              S.of(context).action_restart,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: colorScheme.onPrimary,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
