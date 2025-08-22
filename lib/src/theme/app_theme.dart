import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class PFAppTheme {
  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: PFAppColors.scaffoldBackground,
    primaryColor: PFAppColors.primary,
    textTheme: TextTheme(
      bodyLarge: PFAppTypography.regular,
      bodyMedium: PFAppTypography.small,
      titleLarge: PFAppTypography.bold,
      titleMedium: PFAppTypography.semiBold,
    ),
    useMaterial3: true,
  );
}
