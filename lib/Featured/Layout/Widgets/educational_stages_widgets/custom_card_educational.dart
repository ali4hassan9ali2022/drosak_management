import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:drosak_management/Featured/Layout/Widgets/educational_stages_widgets/card_educational_dara.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardEducational extends StatelessWidget {
  const CustomCardEducational({super.key, required this.items});
  final ItemStageModel items;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.kHeight103,
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
      child: CardEducationalData(items: items),
    );
  }
}