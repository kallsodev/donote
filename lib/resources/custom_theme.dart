import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';

class CustomTheme implements AppThemes {
  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static final _darkTheme = _lightTheme.copyWith(
    brightness: Brightness.dark,
  );

  @override
  ThemeData get darkTheme => _darkTheme;

  @override
  ThemeData get lightTheme => _lightTheme;

  @override
  ThemeData get defaultTheme => _darkTheme;
}
