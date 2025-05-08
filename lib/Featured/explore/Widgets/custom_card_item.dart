import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Widgets/custom_box_shadow.dart';
import 'package:drosak_management/Core/Widgets/custom_number_item.dart';
import 'package:drosak_management/Featured/explore/Models/explore_model.dart';
import 'package:drosak_management/Featured/explore/Widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({super.key, required this.items, required this.index});
  final ExploreModel items;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(top: 80.h, right: 122.w, child: CustomBoxShadow()),
        CustomCard(items: items),
        Positioned(
          top: 80.h,
          right: 122.w,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColor.secondColorBlock,
            // backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          top: 84.h,
          right: 126.w,
          child: CustomNumberItem(index: index),
        ),
      ],
    );
  }
}
