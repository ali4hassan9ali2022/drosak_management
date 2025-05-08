import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/explore/Models/explore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.items});
  final ExploreModel items;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: SizeConfig.kWidth138,
      // height: SizeConfig.kHeight108,
      decoration: BoxDecoration(
        color: AppColor.secondColorBlock,
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius18.r),
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
              // width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(
                  SizeConfig.borderRadius12.r,
                ),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  items.title,
                  style: AppStyles.styleMedium15(context),
                ),
              ),
            ),
          ),
          Expanded(
            child: SvgPicture.asset(
              items.image,
              height: SizeConfig.kHeight63,
            ),
          ),
        ],
      ),
    );
  }
}
