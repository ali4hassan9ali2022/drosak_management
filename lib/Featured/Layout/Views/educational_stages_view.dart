import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_educational_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationalStagesView extends StatelessWidget {
  const EducationalStagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kPadding18.w,
        vertical: SizeConfig.kPadding18.h,
      ),
      child: Column(
        children: [
          CustomEducationalItem(),
        ],
      ),
    );
  }
}

