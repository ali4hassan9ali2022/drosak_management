import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Widgets/custom_box_shadow.dart';
import 'package:drosak_management/Core/Widgets/custom_number_item.dart';
import 'package:drosak_management/Featured/explore/Models/explore_model.dart';
import 'package:drosak_management/Featured/explore/Widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({super.key, required this.items, required this.index});
  final ExploreModel items;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(bottom: -16, left: -16, child: CustomBoxShadow()),
        CustomCard(items: items),
        Positioned(
          bottom: -16,
          left: -16,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColor.secondColorBlock,
          ),
        ),
        Positioned(
          bottom: -12,
          left: -12,
          child: CustomNumberItem(index: index),
        ),
      ],
    );
  }
}