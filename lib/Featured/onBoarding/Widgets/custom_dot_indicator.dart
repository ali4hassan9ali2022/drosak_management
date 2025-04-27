import 'package:dots_indicator/dots_indicator.dart';
import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDotIndcator extends StatelessWidget {
  const CustomDotIndcator({super.key, required this.cubit});

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      height: SizeConfig.kHeight38.h,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.kPadding12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                //! Go to Next View
              },
              child: Text("تخطى", style: AppStyles.styleMedium15(context)),
            ),
            DotsIndicator(
              decorator: DotsDecorator(
                activeColor: AppColor.colorWhite,
                activeSize: Size(11, 10),
              ),

              dotsCount: AppHelper.onBoarding.length,
              position: cubit.currentIndex.toDouble(),
              onTap: (position) {
                cubit.changeDotIndicator(position);
              },
              animate: true,
              animationDuration: Duration(milliseconds: 500),
            ),
            GestureDetector(
              onTap: () {
                if (cubit.isClosed == AppHelper.onBoarding.length - 1) {
                  //! Go to Next View
                } else {
                  cubit.pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text("التالى", style: AppStyles.styleMedium15(context)),
            ),
          ],
        ),
      ),
    );
  }
}
