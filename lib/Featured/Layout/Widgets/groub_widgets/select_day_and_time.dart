import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:drosak_management/Core/Utils/app_styles.dart';
import 'package:drosak_management/Core/Utils/size_config.dart';
import 'package:flutter/material.dart';

class SelectDayAndTime extends StatelessWidget {
  const SelectDayAndTime({
    super.key,
    required this.itmes,
    required this.onChanged,
    this.hintText,
    required this.text,
  });
  final List itmes;
  final Function(dynamic) onChanged;
  final String? hintText;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: CustomDropdown.search(
                hintText: "اختر اليوم",

                items: itmes,
                onChanged: onChanged,
              ),
            ),
          ),
          SizedBox(width: SizeConfig.kWidth15),
          Text(
            text,
            style: AppStyles.styleMedium14(
              context,
            ).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
