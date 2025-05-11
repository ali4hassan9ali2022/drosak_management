import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:flutter/material.dart';

class SelectEducationalStage extends StatelessWidget {
  const SelectEducationalStage({
    super.key,
    required this.itemStageModel,
    required this.onChanged,
  });
  final List<ItemStageModel> itemStageModel;
  final dynamic Function(ItemStageModel?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomDropdown<ItemStageModel>.search(
              hintText: 'اختر المرحلة التعليمية',
              noResultFoundText: "لم يتم العثور على اسم المرحلة التعليمية",
              items: itemStageModel,
              // initialItem: "a",
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: SizeConfig.kWidth7),
        Text("المرحلة التعليمية", style: AppStyles.styleMedium14(context)),
      ],
    );
  }
}
