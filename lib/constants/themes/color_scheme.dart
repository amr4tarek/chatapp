import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    onBackground: Colors.black,
    primary: Color.fromRGBO(3, 169, 244, 1),
    onPrimary: Colors.black,
    secondary: Color.fromRGBO(33, 150, 243, 1),
    onSecondary: Colors.white,
    tertiary: Color.fromRGBO(30, 136, 229, 1),
    error: Colors.red,
    outline: Color(0xFFB0BEC5),
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF121212),
    onBackground: Colors.white,
    primary: Color.fromRGBO(3, 169, 244, 1),
    onPrimary: Colors.black,
    secondary: Color.fromRGBO(33, 150, 243, 1),
    onSecondary: Colors.black,
    tertiary: Color.fromRGBO(30, 136, 229, 1),
    error: Colors.red,
    surface: Color(0xFF333333),
    onSurface: Colors.white,
  ),
);
