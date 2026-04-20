import 'package:flutter/material.dart';
import 'package:chitpad_app/core/theme/app_colors.dart';
import 'package:chitpad_app/core/theme/app_typography.dart';

// ================================================================
//  TODO: After finalizing AppColors and AppTypography:
//    1. Replace ColorScheme.fromSeed() seed with your primary color
//    2. Or replace with ColorScheme.fromSwatch() for full control
//    3. Customize component themes (buttons, inputs, cards) below
// ================================================================

abstract class AppTheme {
  // ── Light Theme ───────────────────────────────────────────
  static ThemeData get light => ThemeData(
        useMaterial3: true,

        // TODO: Replace seed with AppColors.primary once finalized
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,    // TODO
          brightness: Brightness.light,
        ),

        textTheme: AppTypography.textTheme,
        fontFamily: AppTypography.fontFamily,

        // ── Component Themes (customize after design) ───────

        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 1,
          // TODO: Set backgroundColor, titleTextStyle to match design
        ),

        cardTheme: const CardThemeData(
          elevation: 0,
          // TODO: Set color, shape (rounded corners) after design
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 52),
            // TODO: Set backgroundColor, foregroundColor, shape
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // TODO: use AppSpacing.radiusMd
          ),
          filled: true,
          // TODO: Set fillColor, focusedBorder, errorBorder
        ),

        // TODO: Add more component themes as you build pages
      );

  // ── Dark Theme ─────────────────────────────────────────────
  static ThemeData get dark => ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryDark,  // TODO
          brightness: Brightness.dark,
        ),

        textTheme: AppTypography.textTheme,
        fontFamily: AppTypography.fontFamily,

        // TODO: Mirror all light theme customizations for dark
      );
}
