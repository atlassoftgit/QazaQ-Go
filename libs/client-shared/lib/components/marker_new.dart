import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MarkerNew extends StatelessWidget {
  final String? address;
  const MarkerNew({required this.address, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (address != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 52,
                width: 240,
                padding: const EdgeInsets.only(
                    left: 64, top: 8, bottom: 8, right: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x14000000),
                          offset: Offset(0, 3),
                          blurRadius: 15)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: AutoSizeText(
                    address ?? "",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  color: Colors.white,
                  height: 11,
                  width: 16,
                ),
              )
            ],
          ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 10, bottom: 14),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x14000000),
                        offset: Offset(0, 3),
                        blurRadius: 15)
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Ionicons.locate,
                color: Colors.white,
                size: 28,
              ),
            ),
            if (address == null)
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  color: Theme.of(context).colorScheme.primary,
                  height: 11,
                  width: 16,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
