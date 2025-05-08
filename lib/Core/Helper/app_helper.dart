import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Featured/Layout/main_view.dart';
import 'package:drosak_management/Featured/Splash/Views/splash_view.dart';
import 'package:drosak_management/Featured/explore/Models/explore_model.dart';
import 'package:drosak_management/Featured/explore/Views/explore_view.dart';
import 'package:drosak_management/Featured/onBoarding/Models/on_boarding_model.dart';
import 'package:drosak_management/Featured/onBoarding/Views/on_boarding_view.dart';
import 'package:flutter/material.dart';

abstract class AppHelper {

  static const String educationalStagesTableName = "educationalStagesTableName";
  static const String educationalStagesId = "educationalStagesId";
  static const String educationalStagesName = "educationalStagesName";
  static const String educationalStagesDes = "educationalStagesDes";
  static const String educationalStagesImage = "educationalStagesImage";
  static List onBoarding = [
    OnBoardingModel(
      image: Assets.imagesOnBoardingImage1,
      title: "يمكنك إضافة  بعض المراحل التعليمية ",
    ),
    OnBoardingModel(
      image: Assets.imagesOnBoardingImage2,
      title: "يمكنك إضافة  بعض المجموعات لكل مرحلة من المراحل التعليمية",
    ),
    OnBoardingModel(
      image: Assets.imagesOnBoardingImage3,
      title: "يمكنك إضافة  بعض الطلاب لكل جروب الموجودة في كل مرحلة تعليمية",
    ),
    OnBoardingModel(
      image: Assets.imagesOnBoardingImage4,
      title: "يمكنك اضافة حضور و غياب لكل طالب",
    ),
    OnBoardingModel(
      image: Assets.imagesOnBoardingImage5,
      title:
          "يمكنك إضافة  ما إذا كان الطالب دفع هذا الشهر أم لا وإضافة تاريخ الدفع",
    ),
  ];
  static List explore = [
    ExploreModel(
      title: "المراحل التعليمية",
      image: Assets.imagesOnBoardingImage1,
    ),
    ExploreModel(title: "المجموعات", image: Assets.imagesOnBoardingImage2),
    ExploreModel(title: "الطلاب", image: Assets.imagesOnBoardingImage3),
    ExploreModel(title: "الحضور", image: Assets.imagesOnBoardingImage4),
    ExploreModel(title: "الدفع", image: Assets.imagesOnBoardingImage5),
  ];
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashView.id: (context) => SplashView(),
    OnBoardingView.id: (context) => OnBoardingView(),
    ExploreView.id: (context) => ExploreView(),
    MainView.id: (context) => MainView(),
  };
 static void navgatorPushNamed(
    BuildContext context, {
    required String pushNamed,
    Object? arguments,
  }) {
    Navigator.of(context).pushNamed(pushNamed, arguments: arguments);
  }

 static void navgatorpushNamedAndRemoveUntil(
    BuildContext context, {
    required String pushNamed,
    Object? arguments,
    bool isRoute = true,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      pushNamed,
      (route) => isRoute,
      arguments: arguments,
    );
  }
}
