import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Featured/onBoarding/Models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.items});
  final OnBoardingModel items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(items.image),
            SizedBox(height: 72),
            Text(
              textAlign: TextAlign.center,
              items.title,
              style: AppStyles.styleBold20(context),
            ),
          ],
        ),
      ),
    );
  }
}
