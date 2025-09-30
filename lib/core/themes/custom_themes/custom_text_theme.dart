import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 14.28,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
    ),
  );
}
