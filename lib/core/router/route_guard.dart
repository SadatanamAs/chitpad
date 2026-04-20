import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:chitpad_app/core/constants/storage_keys.dart';
import 'package:chitpad_app/core/router/route_names.dart';

/// Redirects to login if no access token is found in secure storage.
/// Runs before any protected route renders.
class AuthGuard extends GetMiddleware {
  final _storage = const FlutterSecureStorage();

  @override
  RouteSettings? redirect(RouteSettings route) {
    final token = _storage.read(key: StorageKeys.accessToken);
    if (token == null) {
      return RouteSettings(name: RouteNames.login);
    }
    return null;
  }
}
