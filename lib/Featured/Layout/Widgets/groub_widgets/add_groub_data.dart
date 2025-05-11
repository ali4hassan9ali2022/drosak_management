import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Core/Widgets/custom_button.dart';
import 'package:drosak_management/Core/Widgets/custom_text_form_field.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/custom_groub_table.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/select_day_and_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddGroubData extends StatelessWidget {
  const AddGroubData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton.filled(
              onPressed: () {
                // showDialog(
                //   barrierDismissible: false,
                //   context: context,
                //   builder: (context) {
                //     return ShowAlertDialog();
                //   },
                // );
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
                // controller: cubit.nameEdController,
                textAlign: TextAlign.end,
                filled: true,
                fillColor: Colors.white,
                hintText: "إسم المجموعة",
              ),
            ),
          ],
        ),
        Divider(height: 20),
        Row(
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDropdown<String>.search(
                  hintText: 'اختر المرحلة التعليمية',
                  noResultFoundText: "لم يتم العثور على اسم المرحلة التعليمية",
                  items: [],
                  // initialItem: "a",
                  onChanged: (value) {
                    log('changing value to: $value');
                  },
                ),
              ),
            ),
            SizedBox(width: SizeConfig.kWidth7),
            Text("المرحلة التعليمية", style: AppStyles.styleMedium14(context)),
          ],
        ),
        SizedBox(height: SizeConfig.kHeight18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            SelectDayAndTime(
              itmes: [],
              text: "اليوم",
              hintText: "اختر اليوم",
              onChanged: (p0) {},
            ),
            SizedBox(width: 15),
            SelectDayAndTime(
              itmes: [],
              onChanged: (p0) {},
              text: "الوقت",
              hintText: "اختر الوقت",
            ),
          ],
        ),
        SizedBox(height: SizeConfig.kHeight20),
        CustomButton(
          borderRadius: SizeConfig.borderRadius12.r,
          color: AppColor.primaryColor,
          width: SizeConfig.kWidth86,
          height: SizeConfig.kHeight27,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: Row(
              children: [
                Icon(Icons.upload, color: Colors.white),
                Text(
                  "إضافة",
                  style: AppStyles.styleMedium12(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: SizeConfig.kHeight12),
        CustomGroubTable(),
        SizedBox(height: SizeConfig.kHeight30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton.filled(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Colors.white),
            ),
            Text("ملاحظة", style: AppStyles.styleMedium14(context)),
          ],
        ),
        SizedBox(height: SizeConfig.kHeight30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: CustomButton(
            borderRadius: SizeConfig.borderRadius12.r,
            color: AppColor.primaryColor,
            width: double.infinity,
            height: SizeConfig.kHeight40,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save, color: Colors.white, size: 24.sp),
                  SizedBox(width: SizeConfig.kWidth10),
                  Text("حفظ الكل", style: AppStyles.styleMedium16(context)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
