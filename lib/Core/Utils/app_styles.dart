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