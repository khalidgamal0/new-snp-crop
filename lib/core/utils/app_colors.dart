import 'package:flutter/material.dart';

abstract class AppColors {
  static final Color primary = HexColor("#9F85F3");
  static final Color secondary = HexColor("#FFCC1A");
  static final Color gray = HexColor("#AEAAAE");
  static final Color darkgray = HexColor("#79767A");
  static final Color darkWhite = HexColor("#F4EFF4");
  static final Color lightPurpleColor = HexColor("#E8DEFF");
  static final Color blackPurpleColor = HexColor("#1B0924");
  static final Color lightPinkColor = HexColor("#FFB6BF");
  static final Color green = HexColor("#3ACC6C");
  static final Color red = HexColor("#B3271C");
  
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
