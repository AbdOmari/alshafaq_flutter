import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:flutter/material.dart';

const _fontFamily = 'Poppins';

TextStyle _textStyle({
  required double size,
  required FontWeight weight,
  required Color color,
}) => TextStyle(fontFamily: _fontFamily, fontWeight: weight, color: color);

TextStyle _lightThemeTextColor({
  required double size,
  required FontWeight weight,
  Color? color,
}) => _textStyle(
  size: size,
  weight: weight,
  color: color ?? const Color(0xff030303),
);
TextStyle _darkThemeTextColor({
  required double size,
  required FontWeight weight,
}) => _textStyle(size: size, weight: weight, color: ColorsManger.surface);
TextStyle lightBold(double size) =>
    _lightThemeTextColor(size: size, weight: FontWeight.bold);

TextStyle lightMedium(double size, {Color? color}) =>
    _lightThemeTextColor(size: size, weight: FontWeight.w400, color: color);

TextStyle lightThin(double size) =>
    _lightThemeTextColor(size: size, weight: FontWeight.w200);

TextStyle darkBold(double size) =>
    _darkThemeTextColor(size: size, weight: FontWeight.bold);

TextStyle darkMedium(double size) =>
    _darkThemeTextColor(size: size, weight: FontWeight.w400);

TextStyle darkThin(double size) =>
    _darkThemeTextColor(size: size, weight: FontWeight.w200);
