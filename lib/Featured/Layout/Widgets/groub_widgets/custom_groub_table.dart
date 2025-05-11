import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGroubTable extends StatelessWidget {
  const CustomGroubTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.white,

        borderRadius: BorderRadius.circular(SizeConfig.borderRadius14.r),
      ),
      children: [
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.kPadding4.h,
                horizontal: SizeConfig.kPadding14.w,
              ),
              child: Center(
                child: Text(
                  "اليوم",
                  style: AppStyles.styleMedium12(
                    context,
                  ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.kPadding4.h,
                horizontal: SizeConfig.kPadding14.w,
              ),
              child: Center(
                child: Text(
                  "الوقت",
                  style: AppStyles.styleMedium12(
                    context,
                  ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.kPadding4.h,
                horizontal: SizeConfig.kPadding14.w,
              ),
              child: Center(
                child: Text(
                  "م / ص",
                  style: AppStyles.styleMedium12(
                    context,
                  ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        for (int i = 0; i <= 6; i++)
          TableRow(
            children: List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                child: Center(
                  child: Text(
                    "${index + 1}",
                    style: AppStyles.styleMedium10(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}









// [
//             Padding(
//               padding: EdgeInsets.only(
//                 top: 9.h,
//                 bottom: 36.h,
//                 left: 7.w,
//                 right: 14.w,
//               ),
//               child: Center(
//                 child: Text(
//                   "السبت",
//                   style: AppStyles.styleMedium12(
//                     context,
//                   ).copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: 7.h,
//                 bottom: 40.h,
//                 left: 16.w,
//                 right: 10.w,
//               ),
//               child: Center(
//                 child: Text(
//                   "10 : 30",
//                   style: AppStyles.styleMedium12(
//                     context,
//                   ).copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: 8.h,
//                 bottom: 36.h,
//                 left: 26.w,
//                 right: 23.w,
//               ),
//               child: Center(
//                 child: Text(
//                   "م",
//                   style: AppStyles.styleMedium12(
//                     context,
//                   ).copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],