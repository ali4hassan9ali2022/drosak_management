import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.kWidth138,
      // height: SizeConfig.kHeight108,
      decoration: BoxDecoration(
        color: AppColor.secondColorBlock,
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius18),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor,
            blurRadius: 10,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.borderRadius12,
                  ),
                ),
                child: Text(
                  "المراحل التعليمية",
                  style: AppStyles.styleMedium15(context),
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            Assets.imagesOnBoardingImage1,
            height: SizeConfig.kHeight63,
          ),
        ],
      ),
    );
  }
}
