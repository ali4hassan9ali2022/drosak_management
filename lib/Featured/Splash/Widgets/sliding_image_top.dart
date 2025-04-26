import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class SlidingImageTop extends StatelessWidget {
  const SlidingImageTop({super.key, required this.position});
  final Animation<Offset> position;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: position,
      builder: (context, _) {
        return SlideTransition(
          position: position,
          child: Image.asset(Assets.imagesSplashBorderImage),
        );
      },
    );
  }
}
