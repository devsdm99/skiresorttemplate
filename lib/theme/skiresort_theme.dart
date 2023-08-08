import 'package:flutter/material.dart';

class SkiResortTheme {
  static const Color primaryColor = Color(0xFF1565C0); // Azul oscuro
  static const Color secondaryColor = Color(0xFF42A5F5); // Azul claro
  static const Color accentColor = Color(0xFFB71C1C); // Rojo oscuro
  static const Color backgroundColor = Color(0xFFFFFFFF); // Blanco
  static const Color surfaceColor = Color(0xFFF5F5F5); // Gris claro
  static const Color primaryButtonColor = Color.fromRGBO(251, 192, 45, 1);
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.white)),
    primaryColor: primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
      ),
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      titleMedium: const TextStyle(
          color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
      titleLarge: const TextStyle(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      labelSmall: const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      labelMedium: const TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
      labelLarge: const TextStyle(
          fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(
        fontSize: 18,
        color: Colors.grey.shade700,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  static ThemeData darkTheme = ThemeData.dark()
      .copyWith(primaryColor: const Color.fromARGB(255, 78, 174, 253));
}
