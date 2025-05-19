import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/card_groub_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardGroub extends StatelessWidget {
  const CustomCardGroub({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.42,
      // height: SizeConfig.kHeight230,
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 0),
            color: AppColor.primaryColor,
          ),
        ],
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.borderRadius18.r),
          side: BorderSide(color: AppColor.primaryColor, width: 1),
        ),
      ),
      child: CardGroubData(),
    );
  }
}
