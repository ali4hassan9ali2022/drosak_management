import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/add_groub_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddGroubSheet extends StatelessWidget {
  const AddGroubSheet({super.key});

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
      child: SingleChildScrollView(child: AddGroubData()),
    );
  }
}
