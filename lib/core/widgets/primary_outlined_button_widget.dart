import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styling/app_colors.dart';

class PrimaryOutlinedButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? textColor;
  final void Function()? onPress;
  final double? fontSize;

  const PrimaryOutlinedButtonWidget({
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
    return OutlinedButton(
        onPressed: onPress,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.primaryColor, width: 1.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          ),
          fixedSize: Size(width ?? 331.w, height ?? 56.h),
        ),
        child: Text(
          buttonText?? "",
          style: TextStyle(
            color: textColor ?? AppColors.primaryColor ,
            fontSize: fontSize ?? 15.sp,
            fontWeight: FontWeight.w600
        ),
        )
    );
  }
}
