import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Featured/Splash/Views/splash_view.dart';
import 'package:drosak_management/Featured/explore/Models/explore_model.dart';
import 'package:drosak_management/Featured/explore/Views/explore_view.dart';
import 'package:drosak_management/Featured/onBoarding/Models/on_boarding_model.dart';
import 'package:drosak_management/Featured/onBoarding/Views/on_boarding_view.dart';
import 'package:flutter/material.dart';

abstract class AppHelper {
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
  };
}
