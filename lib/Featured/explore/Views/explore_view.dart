import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Featured/explore/Widgets/explore_view_body.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});
  static String id = "ExploreView";
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColor.secondColorBlock,
        body: ExploreViewBody(),
      ),
    );
  }
}
