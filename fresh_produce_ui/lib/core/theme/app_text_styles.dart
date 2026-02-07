import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle get bodyLarge =>
      GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle get bodyMedium =>
      GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.normal);

  static TextStyle get bodySmall =>
      GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.normal);

  static TextStyle get h1 =>
      GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold);

  static TextStyle get h2 =>
      GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold);

  static TextStyle get h3 =>
      GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle get label =>
      GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w500);

  AppTextStyles._();
}
