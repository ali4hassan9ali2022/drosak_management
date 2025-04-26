import 'package:drosak_management/Core/Utils/assets.dart';
import 'package:drosak_management/Featured/onBoarding/Models/on_boarding_model.dart';

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
      title: "يمكنك إضافة  ما إذا كان الطالب دفع هذا الشهر أم لا وإضافة تاريخ الدفع",
    ),
  ];
}
