import 'package:drosak_management/Core/Helper/app_helper.dart';
import 'package:drosak_management/Cubit/app_cubit.dart';
import 'package:drosak_management/Featured/onBoarding/Widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppCubit>(context);
    return PageView.builder(
      controller: cubit.pageController,
      itemCount: AppHelper.onBoarding.length,
      itemBuilder: (context, index) {
        return OnBoardingItem(items: AppHelper.onBoarding[cubit.currentIndex]);
      },
    );
  }
}
