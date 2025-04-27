import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
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
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.kPadding18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(items.image, height: SizeConfig.kHeight190),
            SizedBox(height: SizeConfig.kHeight72),
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
