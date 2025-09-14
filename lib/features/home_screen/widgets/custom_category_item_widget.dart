import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_text_styles.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const CustomCategoryItemWidget({
    super.key,
    required this.title,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
          height: 32.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Color(0xffE9EEFA),
              width: 1.sp
            ),
            borderRadius: BorderRadius.circular(56.r)
          ),
          child: Text(title, style: AppTextStyles.subfieldsStyle,),
        ),
      ),
    );
  }
}
