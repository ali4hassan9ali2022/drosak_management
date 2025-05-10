import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowAlertDialogConfirmDelete extends StatelessWidget {
  const ShowAlertDialogConfirmDelete({
    super.key,
    required this.items,
  });

  final ItemStageModel items;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: EdgeInsets.zero,
      icon: Icon(Icons.error, color: Colors.red, size: 60.sp),
      title: Text("هل انت متاكد من الحذف"),
      actions: [
        TextButton(
          onPressed: () {
            BlocProvider.of<DatabaseCubit>(
              context,
            ).deleteDstaEducationalStages(id: items.id!);
            Navigator.of(context).pop(true);
          },
          child: Text('نعم', style: AppStyles.styleMedium20(context)),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text('لا', style: AppStyles.styleMedium20(context)),
        ),
      ],
    );
  }
}
