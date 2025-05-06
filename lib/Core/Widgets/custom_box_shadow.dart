import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomBoxShadow extends StatelessWidget {
  const CustomBoxShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
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
    );
  }
}
