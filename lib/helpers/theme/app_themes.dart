import 'package:flutter/material.dart';
import 'package:flutter_grocery_app/helpers/theme/theme_type.dart';

ThemeData get theme => AppTheme.theme;

class AppTheme {
  static final ThemeData darkTheme = ThemeData();
  static final ThemeData lightTheme = ThemeData();
  static TextDirection textDirection = TextDirection.rtl;
  static ThemeData theme = getTheme();
  static ThemeType themeType = ThemeType.light;

  static ThemeData getTheme([ThemeType? themeType]) {
    themeType = themeType ?? AppTheme.themeType;
    if (themeType == ThemeType.light) return lightTheme;
    return darkTheme;
  }
}
