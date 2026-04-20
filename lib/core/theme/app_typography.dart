import 'package:flutter/material.dart';

// ================================================================
//  TODO: Replace font family after your design decisions.
//  Steps:
//    1. Add your font files to assets/fonts/
//    2. Declare them in pubspec.yaml under flutter: fonts:
//    3. Replace the fontFamily string below
//    4. Adjust font sizes and weights to match your design
// ================================================================

abstract class AppTypography {
  // TODO: Replace with your chosen font family
  static const String fontFamily = 'Roboto';  // TODO

  static const TextTheme textTheme = TextTheme(
    // Display
    displayLarge:  TextStyle(fontSize: 57, fontWeight: FontWeight.w400, fontFamily: fontFamily),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, fontFamily: fontFamily),
    displaySmall:  TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: fontFamily),
    // Headline
    headlineLarge:  TextStyle(fontSize: 32, fontWeight: FontWeight.w600, fontFamily: fontFamily),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, fontFamily: fontFamily),
    headlineSmall:  TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: fontFamily),
    // Title
    titleLarge:  TextStyle(fontSize: 22, fontWeight: FontWeight.w500, fontFamily: fontFamily),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: fontFamily),
    titleSmall:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: fontFamily),
    // Body
    bodyLarge:   TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: fontFamily),
    bodyMedium:  TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: fontFamily),
    bodySmall:   TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: fontFamily),
    // Label
    labelLarge:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: fontFamily),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: fontFamily),
    labelSmall:  TextStyle(fontSize: 11, fontWeight: FontWeight.w500, fontFamily: fontFamily),
  );
}
