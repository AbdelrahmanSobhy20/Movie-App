import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.grey.shade900,
      secondary: Colors.white,
      surface: const Color(0xffffc700),
      onSurface: Colors.yellow[400]!,
    ));
