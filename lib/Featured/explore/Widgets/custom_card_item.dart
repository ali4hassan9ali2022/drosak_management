import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
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
        Positioned(
          bottom: -16,
          left: -16,
          child: Container(
            height: SizeConfig.kWidth32,
            width: SizeConfig.kWidth32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: AppColor.primaryColor,
                  blurRadius: 10,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
          ),
        ),
        CustomCard(
          items: items,
        ),
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
          child: CircleAvatar(
            radius: 12,
            backgroundColor: AppColor.primaryColor,
            child: Center(
              child: Text(
                index.toString(),
                style: AppStyles.styleMedium12(
                  context,
                ).copyWith(color: AppColor.secondColorBlock),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
