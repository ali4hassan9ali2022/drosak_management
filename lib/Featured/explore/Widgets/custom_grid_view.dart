import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/Views/main_view.dart';
import 'package:drosak_management/Featured/explore/Widgets/custom_card_item.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        itemCount: AppHelper.explore.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: SizeConfig.kWidth138 / SizeConfig.kHeight108,
          crossAxisCount: 2,
          crossAxisSpacing: 36,
          mainAxisSpacing: 46,
        ),
        itemBuilder:
            (context, index) => GestureDetector(
              onTap: () {
                AppHelper.navgatorPushNamed(context, pushNamed: MainView.id);
              },
              child: CustomCardItem(items: AppHelper.explore[index])),
      ),
    );
  }
}
