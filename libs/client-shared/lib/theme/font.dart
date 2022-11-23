import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFont {
  static TextStyle style({
    TextStyle? textStyle,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    TextDecoration? decoration,
    double? letterSpacing,
  }) =>
      GoogleFonts.comfortaa(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
        decoration: decoration,
        letterSpacing: letterSpacing,
      );
}