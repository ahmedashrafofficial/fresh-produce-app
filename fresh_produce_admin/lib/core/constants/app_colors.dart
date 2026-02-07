import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFF00695C); // Teal 800

  static const Color primaryLight = Color(0xFF439688);
  static const Color primaryDark = Color(0xFF003D33);
  // Secondary/Accent
  static const Color accent = Color(0xFF80CBC4); // Teal 200

  static const Color accentLight = Color(0xFFB2DFDB);
  // Backgrounds
  static const Color backgroundLight = Color(0xFFF1F5F9);

  static const Color backgroundDark = Color(0xFF0F172A);
  // Surface
  static const Color surfaceLight = Color(0xFFFFFFFF);

  static const Color surfaceDark = Color(0xFF1E293B);
  // Status Colors
  static const Color error = Color(0xFFEF4444);

  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  // Text Colors
  static const Color textPrimaryLight = Color(0xFF0F172A);

  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  // Common
  static const Color white = Colors.white;

  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  AppColors._();
}
