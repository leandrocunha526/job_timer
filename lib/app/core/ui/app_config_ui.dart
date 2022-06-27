import 'package:flutter/material.dart';

class AppConfigUi {
  AppConfigUi._();
  static const MaterialColor _primarySwatch = MaterialColor(
    0xFF0066B0,
    <int, Color>{
      50: Color(0xFF005c9e),
      100: Color(0xFF00528d),
      200: Color(0xFF00477b),
      300: Color(0xFF003d6a),
      400: Color(0xFF003358),
      500: Color(0xFF002946),
      600: Color(0xFF001f35),
      700: Color(0xFF001423),
      800: Color(0xFF000a12),
      900: Color(0xFF000000),
    },
  );
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xFF219FFF),
    primarySwatch: _primarySwatch,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
     focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey)
     ),
    ),
  );
}
