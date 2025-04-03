import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData buildTheme(Brightness brightness) {
    return ThemeData();
  }

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
