import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Featured/onBoarding/Widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // controller: ,
      itemCount: AppHelper.onBoarding.length,
      itemBuilder: (context, index) {
        return OnBoardingItem(items: AppHelper.onBoarding[index]);
      },
    );
  }
}
