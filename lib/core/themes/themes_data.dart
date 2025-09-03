import 'package:e_learning/core/themes/custom_themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: CustomTextTheme.lightTextTheme,
  );
}
