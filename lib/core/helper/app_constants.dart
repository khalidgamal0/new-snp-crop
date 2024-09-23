import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppConstants {
  static const double defaulticonsSize = 24;
  static const double defaultVerticalPadding = 22;
  static const double defaultHorizintalPadding = 22;
  static double defaultRadius = 10.r;
  static final hight24 = SizedBox(height: 24.h);
  static final hight16 = SizedBox(height: 16.h);
  static final hight12 = SizedBox(height: 12.h);
  static final width16 = SizedBox(width: 16.w);
  static final width8 = SizedBox(width: 8.w);
  static const animationDuration = Duration(milliseconds: 600);
  static EdgeInsets defaultScreenPadding = EdgeInsets.symmetric(
      horizontal: defaultHorizintalPadding.w,
      vertical: defaultVerticalPadding.h);

  // static ThemeData datePickerTheme = ThemeData(
  //   colorScheme: ColorScheme.light(
  //     primary: AppColors.primary,
  //     onPrimary: Colors.white,
  //     // surface: Colors.white,
  //     // onSurface: Colors.black,
  //   ),
  //   iconTheme: IconThemeData(color: AppColors.gray),
  //   dividerColor: AppColors.gray,
  //   datePickerTheme: DatePickerThemeData(
  //       backgroundColor: Colors.white,
  //       dividerColor: AppColors.gray,
  //       confirmButtonStyle: ButtonStyle(
  //           foregroundColor: WidgetStatePropertyAll(AppColors.primary)),
  //       cancelButtonStyle: ButtonStyle(
  //           foregroundColor: WidgetStatePropertyAll(AppColors.primary)),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(AppConstants.defaultRadius.r),
  //       ),
  //       inputDecorationTheme: InputDecorationTheme(
  //           border: InputBorder.none,
  //           floatingLabelStyle: AppTextStyles.textStyle16,
  //           floatingLabelBehavior: FloatingLabelBehavior.always)),
  // );
  // static Icon switchToInputEntryModeIcon = Icon(
  //   Icons.edit_outlined,
  //   size: AppConstants.defaulticonsSize.w,
  //   color: AppColors.gray,
  // );
  // static Icon switchToCalendarEntryModeIcon = Icon(
  //   Icons.calendar_today_rounded,
  //   size: AppConstants.defaulticonsSize.w,
  //   color: AppColors.gray,
  // );
}
