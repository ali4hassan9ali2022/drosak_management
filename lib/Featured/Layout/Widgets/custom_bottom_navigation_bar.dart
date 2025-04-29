import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Cubit/app_cubit.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xff1E1E1E),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color(0xff373731),
      currentIndex: cubit.currentIndex,
      selectedItemColor: AppColor.primaryColor,
      items: cubit.icons,
    );
  }
}
