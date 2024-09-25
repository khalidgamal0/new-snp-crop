import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
/*
FontWeight.w100: Thin
FontWeight.w200: Extra Light (Ultra Light)
FontWeight.w300: Light
FontWeight.w400: Normal (Regular)
FontWeight.w500: Medium
FontWeight.w600: Semi Bold (Demi Bold)
FontWeight.w700: Bold
FontWeight.w800: Extra Bold (Ultra Bold)
FontWeight.w900: Black (Heavy)
*/
  static final TextStyle textStyle10 =  TextStyle(
      fontSize: 10.sp,
      color: const Color(0XFFFEFEFE),
      fontWeight: FontWeight.w400);
  static final TextStyle textStyle12 =  TextStyle(
      fontSize: 12.sp,
      color: Colors.black,
      fontWeight: FontWeight.w400);
  static final TextStyle textStyle14 =  TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
      fontWeight: FontWeight.w500);
  static final TextStyle textStyle16 =  TextStyle(
      fontSize: 16.sp,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static final TextStyle textStyle22 =  TextStyle(
      fontFamily: 'Typography',
      fontSize: 22.sp,
      color: Colors.white,
      fontWeight: FontWeight.w500);
}
