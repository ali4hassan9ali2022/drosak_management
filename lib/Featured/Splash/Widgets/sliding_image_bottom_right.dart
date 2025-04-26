import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class SlidingImageBottomRight extends StatelessWidget {
  const SlidingImageBottomRight({super.key, required this.position});
  final Animation<Offset> position;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedBuilder(
        animation: position,
        builder: (context, _) {
          return SlideTransition(
            position: position,
            child: Image.asset(Assets.imagesSplashBorderImageBottom),
          );
        },
      ),
    );
  }
}
