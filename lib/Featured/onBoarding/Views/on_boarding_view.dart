import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Cubit/app_cubit.dart';
import 'package:drosak_management/Cubit/app_state.dart';
import 'package:drosak_management/Featured/onBoarding/Widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String id = "OnBoardingView";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Container(
            color: AppColor.primaryColor,
            height: 38,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("تخطى", style: AppStyles.styleMedium15(context)),
                  Text("التالى", style: AppStyles.styleMedium15(context)),
                ],
              ),
            ),
          ),
          body: OnBoardingViewBody(),
        );
      },
    );
  }
}
