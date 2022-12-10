import 'package:flutter/material.dart';

class SkiResortTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.red,
    textTheme: const TextTheme(
      titleSmall: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(
          fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
      labelLarge: TextStyle(
          fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darkTheme =
      ThemeData.dark().copyWith(primaryColor: Colors.red);
}
