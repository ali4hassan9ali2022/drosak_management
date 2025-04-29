import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationalStagesView extends StatelessWidget {
  const EducationalStagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.kPadding18.w),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.kHeight18),

          Container(
            width: double.infinity,
            height: SizeConfig.kHeight103,
            decoration: ShapeDecoration(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColor.primaryColor, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
