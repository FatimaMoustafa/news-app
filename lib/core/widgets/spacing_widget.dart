import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WidthSpace extends StatelessWidget {
  final double width;
  const WidthSpace({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w,);
  }
}

class HeightSpace extends StatelessWidget {
  final double height;
  const HeightSpace({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h,);
  }
}
