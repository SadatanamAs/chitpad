import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chitpad_app/shared/providers/storage_provider.dart';

/// Creates a ProviderContainer with test overrides.
/// Use for unit testing providers in isolation.
ProviderContainer createTestContainer({
  List<Override> overrides = const [],
}) {
  SharedPreferences.setMockInitialValues({});
  return ProviderContainer(
    overrides: overrides,
  );
}

/// Wraps widget tests with required providers.
/// Usage: tester.pumpWidget(testWidget(const MyWidget()))
Widget testWidget(Widget child) {
  return ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWith(
        (ref) {
          SharedPreferences.setMockInitialValues({});
          throw UnimplementedError(); // initialized in buildScope
        },
      ),
    ],
    child: child,
  );
}
