import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomNumberItem extends StatelessWidget {
  const CustomNumberItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
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
    );
  }
}