import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Cubit/database_cubit/database_state.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_educational_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationalStagesView extends StatelessWidget {
  const EducationalStagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseCubit, DatabaseState>(
      builder: (context, state) {
        if (state is SuccsesGetDataEducational) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.kPadding18.w,
              vertical: SizeConfig.kPadding18.h,
            ),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder:
                  (context, index) => CustomEducationalItem(
                    index: index + 1,
                    items: state.itemStageModel[index],
                  ),
              separatorBuilder:
                  (context, index) => SizedBox(height: SizeConfig.kHeight16),
              itemCount: state.itemStageModel.length,
            ),
          );
        } else if (state is LoadingGetDataEducational) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Text("Error");
        }
      },
    );
  }
}
