import 'package:drosak_management/Cubit/app_cubit.dart';
import 'package:drosak_management/Featured/Layout/Widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static String id = "MainView";
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppCubit>(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(cubit: cubit),
    );
  }
}

