import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_build_result_educational_stages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchDelegateEducational extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isNotEmpty
        ? CustomBuildResultEducationalStages()
        : Center(
          child: Text(
            "ابدأ بالبحث عن البيانات",
            style: AppStyles.styleMedium20(context),
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
  Widget buildSuggestions(BuildContext context) {
    return Text("Ali");
  }
}
