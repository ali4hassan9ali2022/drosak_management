import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.label,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.validator,
    this.obscureText,
    this.controller,
    this.keyboardType,
    this.textAlign,
    this.maxLines,
    this.errorStyle, this.hintStyle,
  });
  final String? hintText;
  final Widget? label;
  final bool? filled;
  final Color? fillColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      onTap: onTap,
      validator: validator,

      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintStyle: hintStyle,
        errorStyle: errorStyle,
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        label: label,
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        filled: filled,
        fillColor: fillColor,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color ?? Colors.grey),
  );
}
