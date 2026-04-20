import 'package:flutter/material.dart';

// ================================================================
//  TODO: Replace ALL placeholder values below with your brand
//  colors after your design decisions are finalized.
//  Recommended workflow:
//    1. Pick your seed color
//    2. Use https://m3.material.io/theme-builder to generate
//       a full ColorScheme
//    3. Replace AppColors values and update AppTheme
// ================================================================

abstract class AppColors {
  // ── Brand (TODO: replace) ──────────────────────────────────
  /// Primary brand color — drives your entire Material 3 color scheme
  static const Color primary        = Color(0xFF6750A4);  // TODO
  static const Color onPrimary      = Color(0xFFFFFFFF);  // TODO
  static const Color primaryContainer    = Color(0xFFEADDFF);  // TODO
  static const Color onPrimaryContainer  = Color(0xFF21005D);  // TODO

  // ── Secondary (TODO: replace) ─────────────────────────────
  static const Color secondary      = Color(0xFF625B71);  // TODO
  static const Color onSecondary    = Color(0xFFFFFFFF);  // TODO

  // ── Error (keep or adjust) ────────────────────────────────
  static const Color error          = Color(0xFFB3261E);
  static const Color onError        = Color(0xFFFFFFFF);

  // ── Neutral surface (TODO: adjust tone if needed) ─────────
  static const Color surface        = Color(0xFFFFFBFE);  // TODO
  static const Color onSurface      = Color(0xFF1C1B1F);  // TODO
  static const Color surfaceVariant = Color(0xFFE7E0EC);  // TODO

  // ── Dark theme equivalents (TODO: fill after light is done)
  static const Color primaryDark             = Color(0xFFD0BCFF);  // TODO
  static const Color onPrimaryDark           = Color(0xFF381E72);  // TODO
  static const Color primaryContainerDark    = Color(0xFF4F378B);  // TODO
  static const Color surfaceDark             = Color(0xFF1C1B1F);  // TODO
  static const Color onSurfaceDark           = Color(0xFFE6E1E5);  // TODO

  // ── Semantic (shared light/dark — adjust if needed) ───────
  static const Color success  = Color(0xFF4CAF50);  // TODO
  static const Color warning  = Color(0xFFFFC107);  // TODO
  static const Color info     = Color(0xFF2196F3);  // TODO
}
