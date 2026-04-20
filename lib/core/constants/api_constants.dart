import 'package:chitpad_app/core/env/env.dart';

abstract class ApiConstants {
  static String get baseUrl => Env.apiBaseUrl;

  // Auth endpoints (GoTrue)
  static const String signIn    = '/auth/v1/token?grant_type=password';
  static const String signUp    = '/auth/v1/signup';
  static const String signOut   = '/auth/v1/logout';
  static const String refreshToken = '/auth/v1/token?grant_type=refresh_token';
  static const String me        = '/auth/v1/user';

  // Notes endpoints (your FastAPI)
  static const String notes     = '/notes';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout    = Duration(seconds: 30);
}
