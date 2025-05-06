import 'package:drosak_management/Core/Widgets/custom_box_shadow.dart';
import 'package:drosak_management/Core/Widgets/custom_number_item.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_card_educational.dart';
import 'package:flutter/material.dart';

class CustomEducationalItem extends StatelessWidget {
  const CustomEducationalItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -6,
          bottom: size.height * 0.14 + 4,
          child: CustomNumberItem(index: index),
        ),
        Positioned(
          bottom: size.height * 0.14,
          right: -10,
          child: CustomBoxShadow(),
        ),
        CustomCardEducational(),
      ],
    );
  }
}
