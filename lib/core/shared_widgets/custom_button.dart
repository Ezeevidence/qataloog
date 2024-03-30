import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_manager.dart';

class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? elevation;
  final Color shadowColor;
  final Color childColor;
  final double? radius;
  final bool isLoading;

  const CustomButton(
      {Key? key,
      this.backgroundColor,
      this.width,
      this.height,
      this.fontSize,
      this.elevation,
      this.shadowColor = ColorManager.white,
      this.childColor = ColorManager.white,
      this.isLoading = false,
      required this.onPressed,
      this.radius,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? ColorManager.primaryOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 24.0)),
              elevation: elevation),
          onPressed: isLoading ? null : onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        text,
                        style: TextStyle(
                            color: childColor,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
