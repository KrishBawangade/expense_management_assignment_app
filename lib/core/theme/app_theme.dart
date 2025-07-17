import 'package:flutter/material.dart';

/// Global app theme configuration
class AppTheme {
  /// theme for the app
  static final appTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light, // or Brightness.dark, your choice
    colorScheme: ColorScheme.fromSeed(
      contrastLevel: 1,
      seedColor: Color(0xFFE6319C),
      primary: Color(0xFFE6319C),
      secondary: Color(0xFF70C187),
      brightness: Brightness.light, // stick to one
    ),
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.grey.shade200,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    // Add other style details like input decoration, button themes, etc.
  );
}
