import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/explore/Widgets/custom_app_bar_explore_view.dart';
import 'package:flutter/material.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: SizeConfig.kHeight40),
          CustomAppBarExploreView(),
          SizedBox(height: SizeConfig.kHeight24),
        ],
      ),
    );
  }
}

