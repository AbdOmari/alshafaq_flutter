import 'package:ashafaq/config/theme/color_manger.dart';
import 'package:ashafaq/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData getTheme(bool isDark) {
  if (isDark) return _darkTheme;
  return _lightTheme;
}

final ThemeData _lightTheme = ThemeData(
  scaffoldBackgroundColor: ColorsManger.surface,
  appBarTheme: const AppBarTheme(color: ColorsManger.surface),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(ColorsMangerDark.surface),
    ),
  ),
  checkboxTheme: const CheckboxThemeData(
    fillColor: WidgetStatePropertyAll(Color(0xff1A1E51)),

    checkColor: WidgetStatePropertyAll(Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.5)),
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Color(0xff1A1E51)),
      elevation: WidgetStatePropertyAll(0),
    ),
  ),
  primaryIconTheme: const IconThemeData(color: ColorsMangerDark.surface),
  primaryColor: ColorsManger.primaryColor,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: ColorsManger.primaryColor,
    onPrimary: Color.fromARGB(255, 16, 69, 61),
    secondary: ColorsManger.accentColor,
    onSecondary: Color.fromARGB(255, 174, 175, 223),
    error: ColorsManger.warningColor,
    onError: ColorsMangerDark.secondaryText,
    surface: ColorsManger.surface,
    onSurface: ColorsManger.onSurface,
    secondaryContainer: Color(0xffF2F2F2),
    inversePrimary: ColorsManger.successColor,
  ),
  iconTheme: const IconThemeData(color: ColorsManger.surface),
  textTheme: TextTheme(
    //?used for text in the elevated button
    labelSmall: darkMedium(13),
    //?used for screen headlines
    headlineMedium: lightBold(25),
    //?used for screen sub headlines
    labelLarge: lightMedium(14, color: const Color(0x80000000)),
    //?used in text fields labels
    labelMedium: lightMedium(12, color: const Color(0x80230A06)),
    //?used for the headlines in the screens
    titleLarge: lightBold(20),
    //?used in packages title
    bodyMedium: lightMedium(14),
    //?used in packages description 
    bodySmall: lightMedium(8),
    titleSmall: lightMedium(20),
    titleMedium: lightBold(18),
    headlineLarge: lightMedium(22),

    bodyLarge: lightMedium(22),

    headlineSmall: lightThin(18),
  ),
);

final ThemeData _darkTheme = ThemeData(
  scaffoldBackgroundColor: ColorsMangerDark.surface,
  primaryColor: ColorsMangerDark.primaryColor,
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStatePropertyAll(ColorsManger.surface)),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Color(0xffF2F2F2)),
      elevation: WidgetStatePropertyAll(5),
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: ColorsManger.primaryColor,
    onPrimary: Color.fromARGB(255, 16, 69, 61),
    secondary: ColorsManger.accentColor,
    onSecondary: Color.fromARGB(255, 174, 175, 223),
    error: ColorsManger.warningColor,
    onError: ColorsMangerDark.secondaryText,
    surface: ColorsManger.surface,
    onSurface: ColorsManger.onSurface,
    secondaryContainer: Color(0xffF2F2F2),
    inversePrimary: ColorsManger.successColor,
  ),
  iconTheme: const IconThemeData(color: ColorsManger.surface),
  textTheme: TextTheme(
    labelSmall: darkThin(11),
    labelMedium: darkMedium(12),
    labelLarge: darkThin(14),
    titleSmall: darkMedium(20),
    titleMedium: darkBold(18),
    titleLarge: darkMedium(22),
    bodySmall: darkMedium(18),
    bodyMedium: darkMedium(20),
    bodyLarge: darkMedium(22),
    headlineMedium: darkMedium(24),
    headlineSmall: darkThin(18),
  ),
);
