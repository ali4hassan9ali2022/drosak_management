import 'package:drosak_management/Core/Utils/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleBold20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: "AA-GALAXY",
      color: AppColor.secondColorBlock,
      fontWeight: FontWeight.w700,
    );
  }
  static TextStyle styleMedium15(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: "GE Dinar One",
      color: AppColor.colorWhite,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: "GE Dinar One",
      color: AppColor.primaryColor,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium8(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      fontFamily: "GE Dinar One",
      color: AppColor.thirdBlock,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: "GE Dinar One",
      color: AppColor.colorWhite,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium10(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: "GE Dinar One",
      color: AppColor.fourBlock,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium12(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: "GE Dinar One",
      color: AppColor.colorWhite,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleMedium14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: "GE Dinar One",
      color: AppColor.primaryColor,
      fontWeight: FontWeight.w500,
    );
  }
}

// scale factor
// responsive fontSiaze
// min , max
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontZize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontZize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
