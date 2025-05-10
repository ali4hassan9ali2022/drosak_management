import 'package:drosak_management/Core/Widgets/custom_box_shadow.dart';
import 'package:drosak_management/Core/Widgets/custom_number_item.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_card_educational.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEducationalItem extends StatelessWidget {
  const CustomEducationalItem({
    super.key,
    required this.index,
    required this.items,
  });
  final int index;
  final ItemStageModel items;
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.sizeOf(context);
    return Dismissible(
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          BlocProvider.of<DatabaseCubit>(
            context,
          ).deleteDstaEducationalStages(id: items.id);
        } else if (direction == DismissDirection.endToStart) {}
      },
      key: ValueKey(items.id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: REdgeInsets.all(5),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white, size: 40.sp),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerLeft,
        padding: REdgeInsets.all(5),
        color: Colors.green,
        child: Icon(Icons.edit, color: Colors.white, size: 40.sp),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -1.w,
            top: -6.h,
            child: CustomNumberItem(index: index),
          ),
          Positioned(top: -10.h, right: -5.w, child: CustomBoxShadow()),
          CustomCardEducational(items: items),
        ],
      ),
    );
  }
}
