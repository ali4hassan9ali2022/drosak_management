import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDayAndTime extends StatelessWidget {
  const SelectDayAndTime({
    super.key,
    required this.itmesDays,
    required this.onChangedDays,
    this.hintText,
    required this.textDays,
    required this.onPressedTime,
    required this.textTime,
  });
  final List itmesDays;
  final Function(dynamic) onChangedDays;
  final String? hintText;
  final String textDays;
  final Function() onPressedTime;
  final String textTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onPressedTime,
                  child: Text(
                    textTime,
                    style: AppStyles.styleMedium14(
                      context,
                    ).copyWith(color: Color(0xff998C8C)),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                "اختار الوقت",
                style: AppStyles.styleMedium14(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomDropdown.search(
                    hintText: "اختر اليوم",
                    items: itmesDays,
                    onChanged: onChangedDays,
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.kWidth15),
              Text(
                textDays,
                style: AppStyles.styleMedium14(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
