import 'package:flutter/material.dart';

final Map appTheme = {
  "light": ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: const Color(0xff233b67),
      elevation: 0,
    ),
    useMaterial3: false,
    brightness: Brightness.light,
  ),
  "dark": ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
  ),
};
