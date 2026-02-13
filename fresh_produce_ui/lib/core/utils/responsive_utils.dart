import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Responsive utility class that provides responsive sizing methods
/// using the responsive_framework package.
abstract class ResponsiveUtils {
  ResponsiveUtils._();

  /// Get responsive font size
  static double fontSize(BuildContext context, double size) {
    return ResponsiveValue<double>(
      context,
      defaultValue: size,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: size),
        Condition.largerThan(name: MOBILE, value: size * 1.05),
        Condition.largerThan(name: TABLET, value: size * 1.15),
      ],
    ).value;
  }

  /// Get responsive height based on design height (typically 812 for mobile)
  static double height(BuildContext context, double size) {
    return ResponsiveValue<double>(
      context,
      defaultValue: size,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: size),
        Condition.largerThan(name: MOBILE, value: size * 1.1),
        Condition.largerThan(name: TABLET, value: size * 1.25),
      ],
    ).value;
  }

  /// Get responsive icon size
  static double iconSize(BuildContext context, double size) {
    return ResponsiveValue<double>(
      context,
      defaultValue: size,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: size),
        Condition.largerThan(name: MOBILE, value: size * 1.1),
        Condition.largerThan(name: TABLET, value: size * 1.2),
      ],
    ).value;
  }

  /// Check if current screen is desktop
  static bool isDesktop(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isDesktop;
  }

  /// Check if current screen is mobile
  static bool isMobile(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isMobile;
  }

  /// Check if current screen is tablet
  static bool isTablet(BuildContext context) {
    return ResponsiveBreakpoints.of(context).isTablet;
  }

  /// Get responsive padding
  static double padding(BuildContext context, double size) {
    return ResponsiveValue<double>(
      context,
      defaultValue: size,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: size),
        Condition.largerThan(name: MOBILE, value: size * 1.1),
        Condition.largerThan(name: TABLET, value: size * 1.25),
      ],
    ).value;
  }

  /// Get responsive radius
  static double radius(BuildContext context, double size) {
    return ResponsiveValue<double>(
      context,
      defaultValue: size,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: size),
        Condition.largerThan(name: MOBILE, value: size * 1.05),
        Condition.largerThan(name: TABLET, value: size * 1.1),
      ],
    ).value;
  }

  /// Get responsive width based on design width (typically 375 for mobile)
  static double width(BuildContext context, double size) {
    return ResponsiveValue<double>(
      context,
      defaultValue: size,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: size),
        Condition.largerThan(name: MOBILE, value: size * 1.1),
        Condition.largerThan(name: TABLET, value: size * 1.25),
      ],
    ).value;
  }
}
