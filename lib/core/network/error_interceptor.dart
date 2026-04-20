import 'package:dio/dio.dart';
import 'package:chitpad_app/core/errors/exceptions.dart';

/// Maps Dio errors to typed app exceptions.
/// Repositories catch these and convert to Failures.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionError:
        throw NetworkException(message: 'Connection error: ${err.message}');

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        final data = err.response?.data as Map<String, dynamic>?;
        final message = data?['detail'] ?? data?['message'] ?? 'Server error';

        if (statusCode == 401) throw const UnauthorizedException();
        throw ServerException(message: message.toString(), statusCode: statusCode);

      default:
        throw ServerException(message: err.message ?? 'Unknown error');
    }
  }
}
