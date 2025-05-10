import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Cubit/database_cubit/database_state.dart';
import 'package:drosak_management/Featured/Layout/Models/item_stage_model.dart';
import 'package:drosak_management/Featured/Layout/Widgets/add_educational_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBottomSheetEditEducationalStages extends StatelessWidget {
  const ShowBottomSheetEditEducationalStages({
    super.key,
    required this.cubit,
    required this.itemStageModel,
  });

  final DatabaseCubit cubit;
  final ItemStageModel itemStageModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseCubit, DatabaseState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom * 1,
          ),
          child: Container(
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
                updata: true,
                onTap: () {
                  cubit.updataNewEducatonal(
                    items: ItemStageModel(
                      id: itemStageModel.id,
                      name: cubit.nameEdController.text,
                      desc: cubit.descEdController.text,
                      image: cubit.profilePic?.path ?? "",
                    ),
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Update Done")));
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
