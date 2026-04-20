import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Failures surface to the presentation layer.
/// Use Either<Failure, T> as the return type in use cases.
@freezed
class Failure with _$Failure {
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  const factory Failure.network({
    @Default('No internet connection') String message,
  }) = NetworkFailure;

  const factory Failure.unauthorized({
    @Default('Session expired. Please log in again.') String message,
  }) = UnauthorizedFailure;

  const factory Failure.cache({
    required String message,
  }) = CacheFailure;

  const factory Failure.unknown({
    @Default('An unexpected error occurred') String message,
  }) = UnknownFailure;
}
