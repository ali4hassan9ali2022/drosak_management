import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff18171C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Assets.imagesSplashBorderImage),
          Align(
            alignment: Alignment.center,
            child: Image.asset(Assets.imagesLogo),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(Assets.imagesSplashBorderImageBottom),
          ),
        ],
      ),
    );
  }
}
