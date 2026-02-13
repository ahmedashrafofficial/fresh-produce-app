import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';
import 'app_text_styles.dart';

abstract class AppTheme {
  static ThemeData get dark {
    final baseTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
    );
    return baseTheme.copyWith(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surfaceDark,
        error: AppColors.error,
        onPrimary: AppColors.white,
        onSecondary: AppColors.textPrimaryDark,
        onSurface: AppColors.textPrimaryDark,
        onError: AppColors.white,
      ),
      textTheme: GoogleFonts.cairoTextTheme(baseTheme.textTheme).copyWith(
        headlineLarge: AppTextStyles.h1.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        headlineMedium: AppTextStyles.h2.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        headlineSmall: AppTextStyles.h3.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        titleLarge: AppTextStyles.h3.copyWith(color: AppColors.textPrimaryDark),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        bodySmall: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textPrimaryDark,
        ),
        labelLarge: AppTextStyles.label.copyWith(
          color: AppColors.textPrimaryDark,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h3.copyWith(
          color: AppColors.textPrimaryDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          textStyle: AppTextStyles.label,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }

  static ThemeData get light {
    final baseTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
    );
    return baseTheme.copyWith(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surfaceLight,
        error: AppColors.error,
        onPrimary: AppColors.white,
        onSecondary: AppColors.textPrimaryLight,
        onSurface: AppColors.textPrimaryLight,
        onError: AppColors.white,
      ),
      textTheme: GoogleFonts.cairoTextTheme(baseTheme.textTheme).copyWith(
        headlineLarge: AppTextStyles.h1.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        headlineMedium: AppTextStyles.h2.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        headlineSmall: AppTextStyles.h3.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        titleLarge: AppTextStyles.h3.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        bodySmall: AppTextStyles.bodySmall.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        labelLarge: AppTextStyles.label.copyWith(
          color: AppColors.textPrimaryLight,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h3.copyWith(color: AppColors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          textStyle: AppTextStyles.label,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceLight,
        elevation: AppDimensions.elevationS,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }

  AppTheme._();
}
