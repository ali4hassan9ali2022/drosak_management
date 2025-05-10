import 'dart:async';

import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Cubit/database_cubit/database_state.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_build_result_educational_stages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchDelegateEducational extends SearchDelegate<String> {
  Timer? _debounce;
  @override
  ThemeData appBarTheme(BuildContext context) {
    return super
        .appBarTheme(context)
        .copyWith(
          textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
          textTheme: super
              .appBarTheme(context)
              .textTheme
              .copyWith(
                titleLarge: TextStyle(color: Colors.white, fontSize: 22.sp),
              ),
          appBarTheme: AppBarTheme(color: AppColor.primaryColor),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.white),
          ),
        );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close, color: Colors.white),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isNotEmpty
        ? CustomBuildResultEducationalStages()
        : Center(
          child: Text(
            "ابدأ الكتابة للبحث..",
            style: AppStyles.styleMedium20(
              context,
            ).copyWith(color: Colors.white),
          ),
        );
  }

  @override
  void showResults(BuildContext context) {
    BlocProvider.of<DatabaseCubit>(
      context,
    ).searchAllEducationalData(searchWord: query);

    super.showResults(context);
  }

  @override
  void close(BuildContext context, String result) {
    _debounce?.cancel();
    super.close(context, result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        BlocProvider.of<DatabaseCubit>(
          context,
        ).searchAllEducationalData(searchWord: query);
      }
    });

    return query.isNotEmpty
        ? BlocBuilder<DatabaseCubit, DatabaseState>(
          builder: (context, state) {
            if (state is SuccsesSearchDataEducational) {
              if (state.itemStageModel.isEmpty) {
                return Center(
                  child: Text(
                    "لا توجد نتائج",
                    style: AppStyles.styleMedium20(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.kPadding18.w,
                  vertical: SizeConfig.kPadding18.h,
                ),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = state.itemStageModel[index];
                    return ListTile(
                      title: Text(
                        item.name,
                        style: AppStyles.styleBold20(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        item.desc,
                        style: AppStyles.styleMedium16(context),
                      ),
                      onTap: () {
                        query = item.name;
                        showResults(context);
                      },
                    );
                  },
                  separatorBuilder:
                      (context, index) =>
                          SizedBox(height: SizeConfig.kHeight16),
                  itemCount: state.itemStageModel.length,
                ),
              );
            } else if (state is LoadingSearchDataEducational) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Text(
                  "ابدأ الكتابة للبحث..",
                  style: AppStyles.styleMedium20(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              );
            }
          },
        )
        : Center(
          child: Text(
            "ابدأ الكتابة للبحث..",
            style: AppStyles.styleMedium20(
              context,
            ).copyWith(color: Colors.white),
          ),
        );
  }
}
