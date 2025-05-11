import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Cubit/app_cubit/app_cubit.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Featured/Layout/Widgets/educational_stages_widgets/add_educational_sheet.dart';
import 'package:drosak_management/Featured/Layout/Widgets/educational_stages_widgets/custom_search_delegate_educational.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar buildAppBar({required AppCubit cubit, required BuildContext context}) {
  var db = BlocProvider.of<DatabaseCubit>(context);
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    actions: [
      Builder(
        builder: (innerContext) {
          return IconButton(
            onPressed: () {
              db.nameEdController.clear();
              db.descEdController.clear();
              db.profilePic = null;
              showModalBottomSheet(
                isScrollControlled: true,
                context: innerContext,
                builder: (context) {
                  switch (cubit.currentIndex) {
                    case 0:
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom * 1,
                        ),
                        child: BlocProvider.value(
                          value: BlocProvider.of<DatabaseCubit>(context),
                          child: AddEducationalSheet(),
                        ),
                      );
                    default:
                      return SizedBox.shrink();
                  }
                },
              );
            },
            icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 24),
          );
        },
      ),
      IconButton(
        onPressed: () {
          switch (cubit.currentIndex) {
            case 0:
              showSearch(
                context: context,
                delegate: CustomSearchDelegateEducational(),
              );
              break;

            default:
              SizedBox.shrink();
          }
        },
        icon: Icon(Icons.search, color: Colors.white, size: 24),
      ),
    ],
    backgroundColor: AppColor.primaryColor,
    title: Text(
      "${cubit.titles[cubit.currentIndex]} ${db.getData.length}",
      style: AppStyles.styleMedium15(context),
    ),
  );
}
