import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/responsive_utils.dart';

abstract class AppTextStyles {
  // Static getters for non-responsive usage
  static TextStyle get bodyLarge =>
      GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle get bodyMedium =>
      GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.normal);

  static TextStyle get bodySmall =>
      GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.normal);

  static TextStyle get h1 =>
      GoogleFonts.cairo(fontSize: 32, fontWeight: FontWeight.bold);

  static TextStyle get h2 =>
      GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.bold);

  static TextStyle get h3 =>
      GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle get label =>
      GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w500);

  AppTextStyles._();

  // Responsive methods
  static TextStyle responsiveBodyLarge(BuildContext context) =>
      GoogleFonts.cairo(
        fontSize: ResponsiveUtils.fontSize(context, 16),
        fontWeight: FontWeight.normal,
      );

  static TextStyle responsiveBodyMedium(BuildContext context) =>
      GoogleFonts.cairo(
        fontSize: ResponsiveUtils.fontSize(context, 14),
        fontWeight: FontWeight.normal,
      );

  static TextStyle responsiveBodySmall(BuildContext context) =>
      GoogleFonts.cairo(
        fontSize: ResponsiveUtils.fontSize(context, 12),
        fontWeight: FontWeight.normal,
      );

  static TextStyle responsiveH1(BuildContext context) => GoogleFonts.cairo(
    fontSize: ResponsiveUtils.fontSize(context, 32),
    fontWeight: FontWeight.bold,
  );

  static TextStyle responsiveH2(BuildContext context) => GoogleFonts.cairo(
    fontSize: ResponsiveUtils.fontSize(context, 24),
    fontWeight: FontWeight.bold,
  );

  static TextStyle responsiveH3(BuildContext context) => GoogleFonts.cairo(
    fontSize: ResponsiveUtils.fontSize(context, 20),
    fontWeight: FontWeight.w600,
  );

  static TextStyle responsiveLabel(BuildContext context) => GoogleFonts.cairo(
    fontSize: ResponsiveUtils.fontSize(context, 14),
    fontWeight: FontWeight.w500,
  );
}
