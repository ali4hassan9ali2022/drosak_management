import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Core/Widgets/custom_button.dart';
import 'package:drosak_management/Core/Widgets/custom_text_form_field.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddEducationalSheet extends StatelessWidget {
  const AddEducationalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DatabaseCubit>(context);
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton.filled(
                  onPressed: () {
                    AppHelper.pickImaegFromGallery(context);
                  },
                  icon: SvgPicture.asset(Assets.imagesPlaceholderSvg),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: CustomTextFormField(
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
              maxLines: 3,
              controller: cubit.descEdController,
              hintText: "الوصف",
              textAlign: TextAlign.end,
              filled: true,
              fillColor: Colors.white,
            ),
            SizedBox(height: 40.h),
            GestureDetector(
              onTap: () {
                cubit.addNewEducatonal();
              },
              child: CustomButton(
                borderRadius: SizeConfig.borderRadius12.r,
                color: AppColor.primaryColor,
                width: SizeConfig.kWidth122,
                height: SizeConfig.kHeight40,
                child: Center(
                  child: Text("إضافة", style: AppStyles.styleMedium16(context)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
