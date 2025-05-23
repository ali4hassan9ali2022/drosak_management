import 'package:drosak_management/Cubit/app_cubit/app_cubit.dart';
import 'package:drosak_management/Cubit/app_cubit/app_state.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:drosak_management/Featured/Layout/Widgets/build_app_bar.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static String id = "MainView";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int initIndex;
  bool initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initialized) {
      initIndex = ModalRoute.of(context)!.settings.arguments as int;
      BlocProvider.of<AppCubit>(context).changeBottomNavBar(initIndex);
      if (initIndex == 0) {
        BlocProvider.of<DatabaseCubit>(context).getAllEducationalData();
      } else if (initIndex == 1) {
        BlocProvider.of<DatabaseCubit>(context).getAllGruopData();
      }
      initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var appCubit = BlocProvider.of<AppCubit>(context);
    var databaseCubit = BlocProvider.of<DatabaseCubit>(context);

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
                if (value == 0) {
                  databaseCubit.getAllEducationalData();
                } else if (value == 1) {
                  databaseCubit.getAllGruopData();
                }
              },
              currentIndex: appCubit.currentIndex,
              items: appCubit.icons,
            ),
            body: PageView.builder(
              controller: appCubit.pageMainController,
              itemCount: appCubit.pages.length,
              onPageChanged: (value) {
                appCubit.changePageMainView(value);
                if (value == 0) {
                  databaseCubit.getAllEducationalData();
                } else if (value == 1) {
                  databaseCubit.getAllGruopData();
                }
              },
              itemBuilder: (context, index) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
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
