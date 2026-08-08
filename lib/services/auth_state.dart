import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthState {
  // All reads/writes go through the OS-level encrypted store.
  static const _storage = FlutterSecureStorage();

  static const _tokenKey = 'jwt_token';
  static const _usernameKey = 'username';

  /// Call after a successful login to persist the token securely.
  static Future<void> saveSession(String token, String username) async {
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _usernameKey, value: username);
  }

  /// Returns the stored token, or null if the user isn't logged in.
  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  static Future<String?> getUsername() async {
    return await _storage.read(key: _usernameKey);
  }

  /// Logout — wipes the stored credentials.
  static Future<void> clearSession() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _usernameKey);
  }

  static Future<bool> isLoggedIn() async {
    return (await getToken()) != null;
  }
}
