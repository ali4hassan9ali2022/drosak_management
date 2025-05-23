import 'package:drosak_management/Core/Widgets/custom_box_shadow.dart';
import 'package:drosak_management/Core/Widgets/custom_number_item.dart';
import 'package:drosak_management/Featured/Layout/Models/groub_details_model.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/custom_card_groub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGroubItem extends StatelessWidget {
  const CustomGroubItem({super.key, required this.index, required this.groubDetailsModel});
  final int index;
  final GroubDetailsModel groubDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -1.w,
          top: -6.h,
          child: CustomNumberItem(index: index),
        ),
        Positioned(top: -10.h, right: -5.w, child: CustomBoxShadow()),
        CustomCardGroub(
          groubDetailsModel: groubDetailsModel,
        ),
        // CustomCardEducational(items: items),
      ],
    );
  }
}
