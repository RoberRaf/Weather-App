import 'package:flutter/material.dart';
import 'package:weather_app/core/theming/theming.dart';

final class TStyle {
  TStyle._();
  static const regular = FontWeight.w200;
  static const semi = FontWeight.w500;
  static const bold = FontWeight.w700;
  static const bolder = FontWeight.w900;

  ///
  static TextStyle darkRegular(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: regular,
    color: Co.dark,
  );
  static TextStyle darkSemi(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: semi,
    color: Co.dark,
  );
  static TextStyle darkBold(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: bold,
    color: Co.dark,
  );
  static TextStyle greyRegular(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: regular,
    color: Co.grey,
  );
  static TextStyle greySemi(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: semi,
    color: Co.grey,
  );
  static TextStyle greyBold(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: bold,
    color: Co.grey,
  );

  ///
  static TextStyle whiteRegular(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: regular,
    color: Co.white,
  );
  static TextStyle whiteSemi(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: semi,
    color: Co.white,
  );
  static TextStyle whiteBold(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: bold,
    color: Co.white,
  );

  ///
  static TextStyle errorRegular(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: regular,
    color: Co.red,
  );
  static TextStyle errorSemi(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: semi,
    color: Co.red,
  );
  static TextStyle errorBold(double fontSize, {bool isTitle = false}) => TextStyle(
    // fontFamily: isTitle ? 'Lemon' : null,
    fontSize: fontSize,
    fontWeight: bold,
    color: Co.red,
  );
}
