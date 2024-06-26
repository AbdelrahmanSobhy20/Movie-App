import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade100,
      primary: Colors.white,
      secondary: Colors.black,
      surface: Colors.blue.shade300,
        onSurface: Colors.blue.shade100,
    )
);