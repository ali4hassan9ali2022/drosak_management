import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.items,
  });
  final Function(int) onTap;
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      backgroundColor: Color(0xff1E1E1E),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color(0xff373731),
      currentIndex: currentIndex,
      selectedItemColor: AppColor.primaryColor,
      items: items,
    );
  }
}
