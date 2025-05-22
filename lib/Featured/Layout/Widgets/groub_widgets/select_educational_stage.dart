import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectEducationalStage extends StatelessWidget {
  const SelectEducationalStage({super.key, this.onChanged});
  final dynamic Function(dynamic)? onChanged;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DatabaseCubit>(context);
    return Row(
      children: [
        Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomDropdown<ItemStageModel>.search(
              listItemBuilder: (context, item, isSelected, onItemSelect) {
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.desc),
                  leading: CircleAvatar(child: Text(item.id.toString())),
                );
              },
              hintText: 'اختر المرحلة التعليمية',
              noResultFoundText: "لم يتم العثور على اسم المرحلة التعليمية",
              items: cubit.getData,
              // initialItem: "a",
              onChanged: onChanged,
              itemsListPadding: EdgeInsets.zero,
              headerBuilder: (context, selectedItem, enabled) {
                return Text(selectedItem.name);
              },
            ),
          ),
        ),
        SizedBox(width: SizeConfig.kWidth7),
        Text("المرحلة التعليمية", style: AppStyles.styleMedium14(context)),
      ],
    );
  }
}
