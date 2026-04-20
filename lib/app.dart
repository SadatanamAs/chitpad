import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:chitpad_app/core/router/app_router.dart';
import 'package:chitpad_app/core/router/route_names.dart';
import 'package:chitpad_app/core/theme/app_theme.dart';

class ChitpadApp extends ConsumerWidget {
  const ChitpadApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Wire theme mode to a Riverpod provider so user can toggle dark/light
    return GetMaterialApp(
      title: 'chitpad',
      debugShowCheckedModeBanner: false,

      // ── Theme ─────────────────────────────────────────────
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,  // TODO: read from shared_preferences provider

      // ── Navigation (GetX) ─────────────────────────────────
      initialRoute: RouteNames.login,
      getPages: AppRouter.pages,
      defaultTransition: Transition.cupertino,  // TODO: adjust after design decisions

      // ── Locale (future) ───────────────────────────────────
      // TODO: Add locale support with flutter_localizations when needed
    );
  }
}
