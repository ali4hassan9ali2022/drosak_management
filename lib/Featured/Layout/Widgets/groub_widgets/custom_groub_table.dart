import 'package:drosak_management/Core/Helper/app_helper_groub.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:drosak_management/Cubit/database_cubit/database_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGroubTable extends StatelessWidget {
  const CustomGroubTable({super.key, required this.isShow});
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DatabaseCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Table(
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
                    style: AppStyles.styleMedium12(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
                    style: AppStyles.styleMedium12(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
                    style: AppStyles.styleMedium12(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              isShow
                  ? Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.kPadding4.h,
                      horizontal: SizeConfig.kPadding14.w,
                    ),
                    child: Center(
                      child: Text(
                        "حذف",
                        style: AppStyles.styleMedium12(context).copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  : SizedBox(),
            ],
          ),
          for (int i = 0; i < AppHelperGroub.items.length; i++)
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.kPadding4.h,
                    horizontal: SizeConfig.kPadding14.w,
                  ),
                  child: Center(
                    child: Text(
                      AppHelperGroub.items[i].day,
                      style: AppStyles.styleMedium12(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
                      AppHelperGroub.items[i].time,
                      style: AppStyles.styleMedium12(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
                      AppHelperGroub.items[i].ms,
                      style: AppStyles.styleMedium12(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cubit.deletefromTableAppointment(index: i);
                  },
                  icon: Icon(Icons.delete, color: Colors.white),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
