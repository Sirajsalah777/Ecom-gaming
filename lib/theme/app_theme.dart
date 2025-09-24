import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.red,
      secondary: Colors.redAccent,
      background: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.red,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
} 