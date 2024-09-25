import 'package:flutter/material.dart';

abstract class AppColors {
  static final Color primary = HexColor("#034537");
  static final Color secondary = HexColor("#006A53");
  static final Color buttonColor = HexColor("#84BD00");
  static final Color grey = HexColor("#5D5959");
  static final Color colorC4A6A6 = HexColor("#C4A6A6");
  static final Color color917F7F = HexColor("#917F7F");
  static final Color color0C7D64 = HexColor("#0C7D64");
  static final Color color6A5555 = HexColor("#6A5555");
  static final Color color514F4F = HexColor("#514F4F");




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
