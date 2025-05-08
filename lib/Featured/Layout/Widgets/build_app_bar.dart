import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Cubit/app_cubit.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({required AppCubit cubit, required BuildContext context}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 24),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search, color: Colors.white, size: 24),
      ),
    ],
    backgroundColor: AppColor.primaryColor,
    title: Text(
      cubit.titles[cubit.currentIndex],
      style: AppStyles.styleMedium15(context),
    ),
  );
}
