import 'package:dio/dio.dart';
import 'package:chitpad_app/core/constants/api_constants.dart';
import 'package:chitpad_app/core/network/auth_interceptor.dart';
import 'package:chitpad_app/core/network/error_interceptor.dart';
import 'package:chitpad_app/core/network/logging_interceptor.dart';

/// Single Dio instance — injected via Riverpod provider.
/// Never instantiate Dio directly in datasources or repositories.
Dio createDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      sendTimeout: ApiConstants.sendTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(dio),      // attaches Bearer token from secure storage
    ErrorInterceptor(),        // maps Dio errors → Failures
    AppLoggingInterceptor(),   // debug logs — strips in release
  ]);

  return dio;
}
