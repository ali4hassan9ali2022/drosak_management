import 'package:drosak_management/Core/Widgets/custom_box_shadow.dart';
import 'package:drosak_management/Core/Widgets/custom_number_item.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_card_educational.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEducationalItem extends StatelessWidget {
  const CustomEducationalItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.sizeOf(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -1.w,
          top: -6.h,
          child: CustomNumberItem(index: index),
        ),
        Positioned(top: -10.h, right: -5.w, child: CustomBoxShadow()),
        CustomCardEducational(),
      ],
    );
  }
}
