import 'package:flutter/material.dart';

import '../helper/app_keys.dart';

ThemeData appLightTheme() {
  return ThemeData(
    fontFamily: AppKeys.fontFamily,
    scaffoldBackgroundColor: Colors.white,
    // primaryColor: AppColors.primary,
    // // hintColor: AppColors.secondary,
    // buttonTheme: ButtonThemeData(
    //   buttonColor: AppColors.primary,
    // ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   selectedItemColor: AppColors.primary,
    //   unselectedItemColor: AppColors.gray,
    //   backgroundColor: Colors.white,
    //   type: BottomNavigationBarType.fixed,
    //   elevation: 10,
    // ),
  );
}
