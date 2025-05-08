import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Cubit/app_cubit/app_cubit.dart';
import 'package:drosak_management/Cubit/app_cubit/app_state.dart';
import 'package:drosak_management/Featured/onBoarding/Widgets/custom_dot_indicator.dart';
import 'package:drosak_management/Featured/onBoarding/Widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String id = "OnBoardingView";
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppCubit>(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.colorWhite,
          bottomNavigationBar: CustomDotIndcator(cubit: cubit),
          body: OnBoardingViewBody(),
        );
      },
    );
  }
}
