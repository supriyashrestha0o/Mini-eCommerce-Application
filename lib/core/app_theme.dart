import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF5B3FD9);
  static const Color background = Color(0xFFFFF1DF);
  static const Color sale = Color(0xFFE53935);
  static const Color star = Color(0xFFFFB300);
  static const Color textSecondary = Color(0xFF6B6B7B);
}

class AppSpacing {
  static const double s = 8;
  static const double m = 16;
  static const double l = 24;
}

const String kCurrency = 'Rs. ';

String formatPrice(double price) => '$kCurrency${price.toStringAsFixed(0)}';

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFF1DF),
      foregroundColor: Colors.black87,
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: false,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}