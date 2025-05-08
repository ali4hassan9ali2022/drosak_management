import 'package:drosak_management/Cubit/app_cubit/app_cubit.dart';
import 'package:drosak_management/Cubit/app_cubit/app_state.dart';
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
    var cubit = BlocProvider.of<AppCubit>(context);
    print(index);
    cubit.changeBottomNavBar(index);
    cubit.currentIndex == index;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: buildAppBar(context: context, cubit: cubit),
            bottomNavigationBar: CustomBottomNavigationBar(
              onTap: (value) {
                cubit.changeBottomNavBar(value);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.icons,
            ),
            body: PageView.builder(
              itemCount: cubit.pages.length,
              controller: cubit.pageMainController,
              onPageChanged: (value) {
                cubit.changePageMainView(value);
              },
              itemBuilder: (context, index) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  switchInCurve: Curves.easeInOut,

                  child: cubit.pages[cubit.currentIndex],
                );
              },
            ),
          ),
        );
      },
    );
  }
}


