import 'package:fpdart/fpdart.dart';
import 'package:chitpad_app/core/errors/exceptions.dart';
import 'package:chitpad_app/core/errors/failures.dart';
import 'package:chitpad_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:chitpad_app/features/auth/domain/entities/user_entity.dart';
import 'package:chitpad_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chitpad_app/features/auth/data/models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await _dataSource.login(email: email, password: password);
      return right(model.toEntity());
    } on UnauthorizedException {
      return left(const Failure.unauthorized());
    } on NetworkException catch (e) {
      return left(Failure.network(message: e.message));
    } on ServerException catch (e) {
      return left(Failure.server(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
  }) async {
    try {
      final model = await _dataSource.register(email: email, password: password);
      return right(model.toEntity());
    } on NetworkException catch (e) {
      return left(Failure.network(message: e.message));
    } on ServerException catch (e) {
      return left(Failure.server(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _dataSource.logout();
      return right(null);
    } catch (_) {
      return right(null); // always succeed locally even if server logout fails
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final model = await _dataSource.getCurrentUser();
      return right(model.toEntity());
    } on UnauthorizedException {
      return left(const Failure.unauthorized());
    } on ServerException catch (e) {
      return left(Failure.server(message: e.message));
    }
  }
}
