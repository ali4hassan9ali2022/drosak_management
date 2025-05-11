import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/custom_groub_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroubView extends StatelessWidget {
  const GroubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.kPadding18.w,
        vertical: SizeConfig.kPadding18.h,
      ),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => CustomGroubItem(index: index + 1),
        separatorBuilder:
            (context, index) => SizedBox(height: SizeConfig.kHeight16),
        itemCount: 2,
      ),
    );
  }
}
