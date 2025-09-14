import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styling/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? textColor;
  final void Function()? onPress;
  final double? fontSize;

  const PrimaryButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
    this.onPress,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          ),
          fixedSize: Size(width ?? 331.w, height ?? 56.h),
        ),

        child: Text(
          buttonText?? "",
          style: TextStyle(
              color: textColor ?? Colors.white ,
              fontSize: fontSize ?? 15.sp,
              fontWeight: FontWeight.w600
          ),
        )
    );
  }
}
