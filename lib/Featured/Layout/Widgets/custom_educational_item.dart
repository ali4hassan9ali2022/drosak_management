
import 'package:drosak_management/Core/Widgets/custom_box_shadow.dart';
import 'package:drosak_management/Core/Widgets/custom_number_item.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_card_educational.dart';
import 'package:flutter/material.dart';


class CustomEducationalItem extends StatelessWidget {
  const CustomEducationalItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -6,
          top: -12,
          child: CustomNumberItem(index: index),
        ),
        Positioned(
          top: -16,
          right: -10,
          child: CustomBoxShadow(),
        ),
        CustomCardEducational(),
      ],
    );
  }
}

