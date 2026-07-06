import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.primary,
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,

      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      cardTheme: const CardThemeData(
        elevation: 1,
        margin: EdgeInsets.zero,
      ),

      dividerColor: AppColors.divider,
    );
  }
}