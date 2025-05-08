import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Core/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddEducationalSheet extends StatelessWidget {
  const AddEducationalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kPadding12.w,
        vertical: SizeConfig.kPadding20.h,
      ),
      decoration: BoxDecoration(
        color: AppColor.fourBlock,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.borderRadius12.r),
          topRight: Radius.circular(SizeConfig.borderRadius12.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton.filled(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesPlaceholderSvg),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: CustomTextFormField(
                  textAlign: TextAlign.end,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "إسم المرحلة التعليمية",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
