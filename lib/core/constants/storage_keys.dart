/// Keys for flutter_secure_storage (auth tokens — encrypted)
/// and shared_preferences (non-sensitive preferences)
abstract class StorageKeys {
  // ── Secure storage (flutter_secure_storage) ───────────────
  static const String accessToken   = 'access_token';
  static const String refreshToken  = 'refresh_token';
  static const String userId        = 'user_id';

  // ── Shared preferences (non-sensitive) ────────────────────
  static const String themeMode     = 'theme_mode';
  static const String locale        = 'locale';

  // TODO: Add keys as you build features
}
