import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Featured/explore/Widgets/custom_card_item.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.onTap});
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        itemCount: AppHelper.explore.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 138 / 108,
          // childAspectRatio: SizeConfig.kWidth138 / SizeConfig.kHeight108,
          crossAxisCount: 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 10,
        ),
        itemBuilder:
            (context, index) => GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: CustomCardItem(
                index: index + 1,
                items: AppHelper.explore[index],
              ),
            ),
      ),
    );
  }
}
