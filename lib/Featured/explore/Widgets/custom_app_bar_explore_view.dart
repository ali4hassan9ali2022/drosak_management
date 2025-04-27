import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomAppBarExploreView extends StatelessWidget {
  const CustomAppBarExploreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.kPadding12),
      child: Text(
        "إستكشف التطبيق",
        style: AppStyles.styleMedium20(context),
      ),
    );
  }
}
