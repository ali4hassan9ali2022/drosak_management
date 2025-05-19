import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Core/Widgets/custom_button.dart';
import 'package:drosak_management/Core/Widgets/custom_text_form_field.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/custom_groub_table.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/select_day_and_time.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/select_educational_stage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddGroubData extends StatelessWidget {
  const AddGroubData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
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
        Divider(height: 20),
        SelectEducationalStage(itemStageModel: [], onChanged: (value) {}),
        SizedBox(height: SizeConfig.kHeight18),
        SelectDayAndTime(
          onPressedTime: () {
            showTimePicker(context: context, initialTime: TimeOfDay.now());
          },
          itmesDays: [],
          onChangedDays: (p0) {},
          textDays: "اليوم",
          hintText: "اختر اليوم",
          textTime: "اختر الوقت",
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
        CustomGroubTable(
          isShow: true,
        ),
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
