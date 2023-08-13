import 'package:flutter/material.dart';

abstract class StylesUI {
  static const Color primaryColor = Color.fromRGBO(37, 95, 221, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color backgroundColor = Color.fromRGBO(247, 249, 252, 1);
  static const Color primaryButtonColor = Color.fromRGBO(251, 192, 45, 1);
  static const Color transparent = Colors.transparent;
  static const Color grey = Color.fromRGBO(112, 112, 112, 1);

  static TextStyle homeTypeStyle = const TextStyle(
    color: Colors.white,
  );

  static TextStyle subtitleStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);

  static TextStyle homeMenuButtonStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black);

  static TextStyle homeBigMenuButtonStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black);

  static const TextStyle headlineStyle = TextStyle(
    fontWeight: FontWeight.w500,
  );

  static TextStyle heading = headlineStyle.copyWith(
    color: black,
    fontSize: 16,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static TextStyle titleStyle = bodyStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subtitle = bodyStyle.copyWith(
    fontSize: 14,
  );
}
