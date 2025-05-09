import 'package:drosak_management/Cubit/app_cubit/app_cubit.dart';
import 'package:drosak_management/Cubit/app_cubit/app_state.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Featured/Layout/Widgets/build_app_bar.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static String id = "MainView";
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    var appCubit = BlocProvider.of<AppCubit>(context);
    var databaseCubit = BlocProvider.of<DatabaseCubit>(context);
    print(index);
    appCubit.changeBottomNavBar(index);
    if(index == 0) {
      databaseCubit.getAllEducationalData();
    }
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: buildAppBar(context: context, cubit: appCubit),
            bottomNavigationBar: CustomBottomNavigationBar(
              onTap: (value) {
                
                appCubit.changeBottomNavBar(value);
                if(index == 0) {
      databaseCubit.getAllEducationalData();
    }
              },
              currentIndex: appCubit.currentIndex,
              items: appCubit.icons,
            ),
            body: PageView.builder(
              itemCount: appCubit.pages.length,
              controller: appCubit.pageMainController,
              onPageChanged: (value) {
                appCubit.changePageMainView(value);
                if(value == 0) {
      databaseCubit.getAllEducationalData();
    }
              },
              itemBuilder: (context, index) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  switchInCurve: Curves.easeInOut,
          
                  child: appCubit.pages[appCubit.currentIndex],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
