import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEducationalItem extends StatelessWidget {
  const CustomEducationalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -6,
          top: -12,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: AppColor.primaryColor,
            child: Center(
              child: Text(
                "I",
                style: AppStyles.styleMedium12(
                  context,
                ).copyWith(color: AppColor.secondColorBlock),
              ),
            ),
          ),
        ),
        Positioned(
          top: -16,
          right: -10,
          child: Container(
            height: SizeConfig.kWidth32,
            width: SizeConfig.kWidth32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: AppColor.primaryColor,
                  blurRadius: 10,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
          ),
        ),
        Container(
          // padding: EdgeInsets.only(top: 6, right: 25),
          width: double.infinity,
          height: SizeConfig.kHeight103,
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 0),
                color: AppColor.primaryColor,
              ),
            ],
            color: Colors.transparent,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConfig.borderRadius18),
              side: BorderSide(color: AppColor.primaryColor, width: 1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.kPadding25.w,
                    vertical: SizeConfig.kPadding6.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الصف الأول الإعدادي",
                        style: AppStyles.styleMedium16(context),
                      ),
                      Text(
                        "تلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلا",
                        style: AppStyles.styleMedium10(context),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kPadding10.w,
                  vertical: SizeConfig.kPadding20.h,
                ),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(Assets.imagesTest),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
