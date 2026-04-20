import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:chitpad_app/core/constants/storage_keys.dart';
import 'package:chitpad_app/core/constants/api_constants.dart';

/// Attaches the Bearer token to every outgoing request.
/// On 401 → attempts a silent token refresh.
/// On refresh failure → clears tokens and redirects to login.
class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final _storage = const FlutterSecureStorage();

  AuthInterceptor(this._dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(key: StorageKeys.accessToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      try {
        await _refreshToken();
        // Retry the original request with new token
        final token = await _storage.read(key: StorageKeys.accessToken);
        final opts = err.requestOptions;
        opts.headers['Authorization'] = 'Bearer $token';
        final response = await _dio.fetch(opts as RequestOptions);
        return handler.resolve(response);
      } catch (_) {
        // Refresh failed — clear all tokens, route to login
        await _storage.deleteAll();
        // GetX navigation — only usage point of GetX in the app
        // import 'package:get/get.dart';
        // Get.offAllNamed(RouteNames.login);
      }
    }
    handler.next(err);
  }

  Future<void> _refreshToken() async {
    final refresh = await _storage.read(key: StorageKeys.refreshToken);
    if (refresh == null) throw Exception('No refresh token');

    final response = await _dio.post(
      ApiConstants.refreshToken,
      data: {'refresh_token': refresh},
    );

    final newAccessToken = response.data['access_token'] as String;
    final newRefreshToken = response.data['refresh_token'] as String;
    await _storage.write(key: StorageKeys.accessToken, value: newAccessToken);
    await _storage.write(key: StorageKeys.refreshToken, value: newRefreshToken);
  }
}
