import 'package:flutter/material.dart';

import 'constants/app_colors.dart';

class AppTheme {
  static ThemeData buildTheme({Brightness brightness = Brightness.light}) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: brightness,
      ).copyWith(primary: AppColors.primary),
      highlightColor: AppColors.primary,
    );
  }

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
