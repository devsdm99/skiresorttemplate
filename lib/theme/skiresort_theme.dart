import 'package:flutter/material.dart';

class SkiResortTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.red,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.red,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.black,
          onBackground: Colors.black,
          surface: Colors.black,
          onSurface: Colors.black),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.yellow.shade700,
              onPrimary: Colors.yellow.shade700,
              secondary: Colors.white,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.red,
              background: Colors.black,
              onBackground: Colors.black,
              surface: Colors.black,
              onSurface: Colors.black)),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        labelLarge: TextStyle(
            fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      textButtonTheme: TextButtonThemeData(
          style:
              TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20))));

  static ThemeData darkTheme =
      ThemeData.dark().copyWith(primaryColor: Colors.red);
}
