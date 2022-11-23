import 'package:client_shared/components/back_button.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../data/images.dart';
import '../generated/l10n.dart';

class ProgramView extends StatelessWidget {
  const ProgramView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RidyBackButton(titleRidyBackButton: S.of(context).action_back),
            const SizedBox(
              height: 36,
            ),
            Text(
              S.of(context).program_intro,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            AspectRatio(
              aspectRatio: 1.2,
              child: PhotoView(
                maxScale: 4.0,
                backgroundDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                imageProvider: const AssetImage(Images.program),
              ),
            ),
            Text(
              S.of(context).program_asterisk,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
