import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.grey[800],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[100],
    foregroundColor: Colors.black,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.grey[800]!,
    secondary: Colors.grey[600]!,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    inversePrimary: Colors.grey[300]!, // contrast shade for highlights
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
    titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[100],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey),
    ),
    hintStyle: TextStyle(color: Colors.grey[600]),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey[800],
    textTheme: ButtonTextTheme.primary,
  ),
);
