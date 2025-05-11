import 'dart:io';

import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Core/Widgets/custom_button.dart';
import 'package:drosak_management/Core/Widgets/custom_text_form_field.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Featured/Layout/Widgets/educational_stages_widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddEducationalData extends StatelessWidget {
  const AddEducationalData({
    super.key,
    required this.cubit,
    this.updata = false, this.onTap,
  });

  final DatabaseCubit cubit;
  final bool updata;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.keyState,
      child: Column(
        children: [
          Row(
            children: [
              IconButton.filled(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return ShowAlertDialog();
                    },
                  );
                },
                icon: SvgPicture.asset(Assets.imagesPlaceholderSvg),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: CustomTextFormField(
                  errorStyle: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل اسم المجموعة";
                    }
                    return null;
                  },
                  controller: cubit.nameEdController,
                  textAlign: TextAlign.end,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "إسم المرحلة التعليمية",
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "من فضلك ادخل وصف المجموعة";
              }
              return null;
            },
            errorStyle: TextStyle(color: Colors.white),
            maxLines: 3,
            controller: cubit.descEdController,
            hintText: "الوصف",
            textAlign: TextAlign.end,
            filled: true,
            fillColor: Colors.white,
          ),
          SizedBox(height: 12.h),
          cubit.profilePic == null
              ? Text("Not Selected", style: AppStyles.styleMedium20(context))
              : Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.borderRadius12.r,
                    ),
                    child: Image.file(
                      fit: BoxFit.cover,
                      File(cubit.profilePic!.path),
                      width: 120.w,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {
                      cubit.removeProfilePic();
                    },
                    icon: Icon(Icons.delete, color: Colors.white),
                  ),
                ],
              ),
          SizedBox(height: 40.h),
          GestureDetector(
            onTap: onTap,
            child: CustomButton(
              borderRadius: SizeConfig.borderRadius12.r,
              color: AppColor.primaryColor,
              width: SizeConfig.kWidth122,
              height: SizeConfig.kHeight40,
              child: Center(
                child: Text(
                  updata ? "تحديث" : "إضافة",
                  style: AppStyles.styleMedium16(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
