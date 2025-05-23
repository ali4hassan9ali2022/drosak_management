import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/Models/groub_details_model.dart';
import 'package:drosak_management/Featured/Layout/Widgets/groub_widgets/custom_groub_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardGroubData extends StatelessWidget {
  const CardGroubData({super.key, required this.groubDetailsModel});
  final GroubDetailsModel groubDetailsModel;
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
                    groubDetailsModel.name,
                    style: AppStyles.styleMedium16(context),
                  ),
                ),
                SizedBox(height: SizeConfig.kHeight8),
                Expanded(child: CustomGroubTable(isShow: false)),
                SizedBox(height: SizeConfig.kHeight8),
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  "الملاحظات : ${groubDetailsModel.note}",
                  style: AppStyles.styleMedium10(
                    context,
                  ).copyWith(color: Colors.white),
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
                  // items.image.isEmpty
                  AssetImage(Assets.imagesTest) as ImageProvider,
              // : FileImage(File(items.image)),
            ),
          ),
        ),
      ],
    );
  }
}
