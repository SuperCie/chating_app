import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      surface: const Color(0xFFFAFAFA),
      primary: Colors.grey.shade400,
      secondary: Colors.grey.shade200,
      tertiary: Colors.grey.shade900,
      inversePrimary: const Color(0xFF4CAF50),
      onPrimary: Colors.grey.shade400),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      surface: const Color(0xFF424242),
      primary: Colors.grey.shade400,
      secondary: Colors.grey.shade200,
      tertiary: Colors.white,
      inversePrimary: const Color(0xFF2E7D32),
      onPrimary: const Color(0xFF616161)),
);
