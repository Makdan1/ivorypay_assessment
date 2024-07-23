import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivorypay/utils/app_colors.dart';
import 'package:ivorypay/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final String? label;
  final int? maxLength;
  final dynamic validator;
  final bool? obscure;
  final bool? enable;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.hint,
    this.label,
    this.maxLength,
    this.validator,
    this.obscure = false,
    this.enable = true,
    this.inputType,
    this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure!,
      validator: validator != null ? validator : null,
      maxLength: maxLength != null ? maxLength : null,
      controller: controller,
      enabled: enable!,
      keyboardType: inputType == null ? TextInputType.text : inputType,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        labelText: label,
        hintText: hint,
        suffixIcon: suffixIcon ?? null,
        hintStyle: GoogleFonts.urbanist(
          fontSize: 15,
          color: Color(0xff8391A1),
        ),
        labelStyle: GoogleFonts.urbanist(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xff8391A1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: AppColors.greyFaint),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: AppColors.greyFaint,
            width: 1.6.h,
          ),
        ),
        errorStyle: const TextStyle(color: AppColors.red),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
