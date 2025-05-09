import 'dart:io';

import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardEducationalData extends StatelessWidget {
  const CardEducationalData({
    super.key,
    required this.items,
  });

  final ItemStageModel items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.kPadding25.w,
              vertical: SizeConfig.kPadding6.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    items.name,
                    style: AppStyles.styleMedium16(context),
                  ),
                ),
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    items.desc,
                    style: AppStyles.styleMedium10(context),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kPadding10.w,
            vertical: SizeConfig.kPadding20.h,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CircleAvatar(
              radius: SizeConfig.borderRadius32.r,
              backgroundImage:
                  items.image.isEmpty
                      ? AssetImage(Assets.imagesTest) as ImageProvider
                      : FileImage(File(items.image)),
            ),
          ),
        ),
      ],
    );
  }
}