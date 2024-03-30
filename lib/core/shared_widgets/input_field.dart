import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_manager.dart';
import '../utils/style_manager.dart';

enum AppTextFieldType { isPassword, isEmail, isText, isOutlinePassword, isOTP }

class CustomTextInputWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isObscure;
  final String hintText;
  final Widget? suffixIcon;
  final AppTextFieldType textFieldType;
  final int maxLines;
  final TextInputType? textInputType;
  final Function(String)? onChanged;

  const CustomTextInputWidget(
      {super.key,
      required this.controller,
      this.hintText = '',
      this.isObscure = false,
      this.suffixIcon,
      this.textFieldType = AppTextFieldType.isText,
      this.title = '',
      this.textInputType,
      this.maxLines = 1,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: maxLines,
      cursorColor: ColorManager.white,
      style: getMediumTextStyle(color: ColorManager.textGrey, fontSize: 18.sp),
      decoration: InputDecoration(
        fillColor: ColorManager.white,

        suffixIcon: suffixIcon,
        filled: true,
        hintText: hintText,
        focusColor: ColorManager.primaryOrange,

        hintStyle:
            getMediumTextStyle(color: ColorManager.textGrey, fontSize: 16.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey, width: 0.2),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorManager.textGrey,
              width: 0.2,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              const BorderSide(color: ColorManager.textGrey, width: 0.2),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red, width: 0.2)),
        contentPadding: EdgeInsets.symmetric(
            vertical: 18.h, horizontal: 24.w), // <-- SEE HERE
      ),
    );
  }
}
