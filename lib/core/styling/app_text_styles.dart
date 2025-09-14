import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles{
  static TextStyle primaryHeadlineStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 32.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subtitleStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 18.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subfieldsStyle = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 14.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle grey12w400Style = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 12.sp,
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle black16w400Style = TextStyle(
    fontFamily: AppFonts.mainFont,
    fontSize: 16.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
  );
}