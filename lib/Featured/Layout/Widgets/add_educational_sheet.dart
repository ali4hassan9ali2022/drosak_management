import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Cubit/database_cubit/database_state.dart';
import 'package:drosak_management/Featured/Layout/Widgets/add_educational_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEducationalSheet extends StatelessWidget {
  const AddEducationalSheet({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DatabaseCubit>(context);
    return BlocBuilder<DatabaseCubit, DatabaseState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.kPadding12.w,
            vertical: SizeConfig.kPadding20.h,
          ),
          decoration: BoxDecoration(
            color: AppColor.fourBlock,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConfig.borderRadius12.r),
              topRight: Radius.circular(SizeConfig.borderRadius12.r),
            ),
          ),
          child: SingleChildScrollView(
            child: AddEducationalData(
              cubit: cubit,
              onTap: () {
                if (cubit.keyState.currentState!.validate()) {
                  cubit.keyState.currentState!.save();

                  cubit.addNewEducatonal();

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Add Done")));
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
