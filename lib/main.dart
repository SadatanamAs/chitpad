import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chitpad_app/app.dart';
import 'package:chitpad_app/shared/providers/storage_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Preferred orientations — portrait by default
  // TODO: Allow landscape on tablet if needed
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize SharedPreferences before ProviderScope
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        // Inject initialized SharedPreferences into the provider graph
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const ChitpadApp(),
    ),
  );
}
