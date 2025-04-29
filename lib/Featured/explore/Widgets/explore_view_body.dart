import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/main_view.dart';
import 'package:drosak_management/Featured/explore/Widgets/custom_app_bar_explore_view.dart';
import 'package:drosak_management/Featured/explore/Widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.kHeight40),
          CustomAppBarExploreView(),
          SizedBox(height: SizeConfig.kHeight24),
          CustomGridView(
            onTap: (index) {
              AppHelper.navgatorPushNamed(context, pushNamed: MainView.id, arguments: index);
            },
          ),
        ],
      ),
    );
  }
}
