import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFF2D6A4F);

  static const Color primaryLight = Color(0xFF52B788);
  static const Color primaryDark = Color(0xFF1B4332);
  // Secondary/Accent
  static const Color accent = Color(0xFF95D5B2);

  static const Color accentLight = Color(0xFFD8F3DC);
  // Backgrounds
  static const Color backgroundLight = Color(0xFFF8F9FA);

  static const Color backgroundDark = Color(0xFF121212);
  // Surface
  static const Color surfaceLight = Color(0xFFFFFFFF);

  static const Color surfaceDark = Color(0xFF1E1E1E);
  // Status Colors
  static const Color error = Color(0xFFD90429);
  static const Color success = Color(0xFF2D6A4F);
  static const Color warning = Color(0xFFFFB703);
  static const Color info = Color(0xFF4361EE);
  static const Color neutral = Color(0xFF6C757D);
  // Text Colors
  static const Color textPrimaryLight = Color(0xFF1B4332);

  static const Color textSecondaryLight = Color(0xFF6C757D);
  static const Color textPrimaryDark = Color(0xFFE9ECEF);
  static const Color textSecondaryDark = Color(0xFFADB5BD);
  // Common
  static const Color white = Colors.white;

  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  AppColors._();
}
