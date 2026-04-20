import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:chitpad_app/core/network/api_client.dart';
import 'package:chitpad_app/core/router/route_names.dart';
import 'package:chitpad_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:chitpad_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chitpad_app/features/auth/domain/entities/user_entity.dart';
import 'package:chitpad_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chitpad_app/shared/providers/storage_provider.dart';

// ── Dependency providers ──────────────────────────────────────

final dioProvider = Provider((ref) => createDioClient());

final authDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(
    dio: ref.watch(dioProvider),
    storage: ref.watch(secureStorageProvider),
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authDataSourceProvider));
});

// ── Auth state ────────────────────────────────────────────────

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState { const AuthInitial(); }
class AuthLoading extends AuthState { const AuthLoading(); }
class AuthAuthenticated extends AuthState {
  final UserEntity user;
  const AuthAuthenticated(this.user);
}
class AuthUnauthenticated extends AuthState { const AuthUnauthenticated(); }
class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}

// ── Auth notifier ─────────────────────────────────────────────

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repo;

  AuthNotifier(this._repo) : super(const AuthInitial());

  Future<void> login({required String email, required String password}) async {
    state = const AuthLoading();
    final result = await _repo.login(email: email, password: password);
    state = result.fold(
      (failure) => AuthError(failure.when(
        server: (msg, _) => msg,
        network: (msg) => msg,
        unauthorized: (msg) => msg,
        cache: (msg) => msg,
        unknown: (msg) => msg,
      )),
      (user) {
        Get.offAllNamed(RouteNames.notesList);  // GetX navigation
        return AuthAuthenticated(user);
      },
    );
  }

  Future<void> register({required String email, required String password}) async {
    state = const AuthLoading();
    final result = await _repo.register(email: email, password: password);
    state = result.fold(
      (failure) => AuthError(failure.when(
        server: (msg, _) => msg,
        network: (msg) => msg,
        unauthorized: (msg) => msg,
        cache: (msg) => msg,
        unknown: (msg) => msg,
      )),
      (user) {
        Get.offAllNamed(RouteNames.notesList);
        return AuthAuthenticated(user);
      },
    );
  }

  Future<void> logout() async {
    await _repo.logout();
    state = const AuthUnauthenticated();
    Get.offAllNamed(RouteNames.login);  // GetX navigation
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
