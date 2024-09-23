import 'package:flutter/material.dart';

abstract class AppColors {
  static final Color primary = HexColor("#84BD00");
  static final Color secondary = HexColor("#FFCC1A");

  
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
