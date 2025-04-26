import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class SlidingImageLogo extends StatelessWidget {
  const SlidingImageLogo({
    super.key,
    required this.animation,
  });

  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return SlideTransition(
          position: animation,
          child: Image.asset(Assets.imagesLogo),
        );
      },
    );
  }
}