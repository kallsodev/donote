import 'package:donote/resources/colors.dart';
import 'package:donote/resources/strings.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';

class CustomTheme implements AppThemes {

  const CustomTheme();

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: Strings.fontFamily,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColor,
      brightness: Brightness.dark,
      secondary: AppColors.secondaryColor,
      tertiary: AppColors.tertiaryColor,
    ),
    cardColor: AppColors.tertiaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0
    ),
    hintColor: AppColors.hintColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: const TextStyle(
        color: AppColors.errorColor,
      ),
      hintStyle: const TextStyle(
        color: AppColors.hintColor,
      ),
      fillColor: AppColors.primaryColor,
      filled: true,
      border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    ),
    textTheme: const TextTheme(
      caption: TextStyle(color: AppColors.hintColor, fontSize: 10),
      subtitle1: TextStyle(color: AppColors.secondaryColor, fontSize: 12),
      subtitle2: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14,
      ),
      button: TextStyle(color: AppColors.primaryColor, fontSize: 16, fontWeight: FontWeight.w700),
      headline1: TextStyle(color: AppColors.secondaryColor, fontWeight: FontWeight.w600),
      headline2: TextStyle(color: AppColors.secondaryColor, fontWeight: FontWeight.w600, fontSize: 30),
      headline3: TextStyle(color: AppColors.primaryColor, fontSize: 15),
      headline4: TextStyle(color: AppColors.secondaryColor, fontSize: 14, fontWeight: FontWeight.w600, height: 1),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.secondaryColor),
  );

  @override
  ThemeData get darkTheme => _darkTheme;

  @override
  ThemeData get lightTheme => _lightTheme;

  @override
  ThemeData get defaultTheme => _darkTheme;
}
