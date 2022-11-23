import 'package:flutter/material.dart';

class UserAvatarView extends StatelessWidget {
  final double cornerRadius;
  final double size;
  final String? urlPrefix;
  final String? url;
  final String? image;
  final Color? backgroundColor;

  const UserAvatarView(
      {required this.cornerRadius,
      required this.size,
      this.image,
      this.backgroundColor,
      this.urlPrefix,
      this.url,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // assert(!(image == null || (urlPrefix == null && url == null)),
    //     'Provide either image or url!');

    final colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius),
      child: url != null
          ? Image.network(
              '$urlPrefix$url',
              width: size,
              height: size,
              fit: BoxFit.cover,
            )
          : Container(
              width: size,
              height: size,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(cornerRadius),
                color: colorScheme.secondaryContainer,
              ),
              child: Image.asset(
                image!,
              ),
            ),
    );
  }
}
