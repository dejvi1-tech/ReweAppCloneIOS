import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user.dart';
import '../api/api_client.dart';
import '../mock_data/mock_data.dart';

class AuthService {
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = 'auth_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userKey = 'user_data';

  final ApiClient _apiClient;

  AuthService(this._apiClient);

  Future<bool> get isAuthenticated async {
    final token = await _storage.read(key: _tokenKey);
    return token != null;
  }

  Future<User?> get currentUser async {
    final userData = await _storage.read(key: _userKey);
    if (userData != null) {
      try {
        final userMap = Map<String, dynamic>.from(
          Uri.splitQueryString(userData)
            ..removeWhere((key, value) => value.isEmpty)
        );
        return User.fromJson(userMap);
      } catch (e) {
        // If parsing fails, return mock user for demo
        return MockData.mockUser;
      }
    }
    return null;
  }

  Future<AuthResult> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final data = response.data;
        final user = MockData.mockUser; // Use mock user for demo

        await _storage.write(key: _tokenKey, value: data['access_token']);
        await _storage.write(key: _refreshTokenKey, value: data['refresh_token']);
        await _storage.write(key: _userKey, value: user.toJson().toString());

        return AuthResult.success(user);
      }

      return AuthResult.failure('Anmeldung fehlgeschlagen');
    } catch (e) {
      return AuthResult.failure('Netzwerkfehler: ${e.toString()}');
    }
  }

  Future<AuthResult> signUpWithEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await _apiClient.post('/auth/register', data: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
      });

      if (response.statusCode == 201) {
        final data = response.data;
        final user = MockData.mockUser.copyWith(
          email: email,
          firstName: firstName,
          lastName: lastName,
        ); // Use mock user with provided details

        await _storage.write(key: _tokenKey, value: data['access_token']);
        await _storage.write(key: _refreshTokenKey, value: data['refresh_token']);
        await _storage.write(key: _userKey, value: user.toJson().toString());

        return AuthResult.success(user);
      }

      return AuthResult.failure('Registrierung fehlgeschlagen');
    } catch (e) {
      return AuthResult.failure('Netzwerkfehler: ${e.toString()}');
    }
  }

  Future<AuthResult> signInWithApple() async {
    try {
      // Simulate Apple Sign-In for demo
      await Future.delayed(const Duration(seconds: 1));
      return AuthResult.failure('Apple Sign-In ist in der Demo-Version nicht verfügbar');
    } catch (e) {
      return AuthResult.failure('Apple Sign-In Fehler: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    try {
      await _apiClient.post('/auth/logout');
    } catch (e) {
      print('Logout API call failed: $e');
    } finally {
      await _storage.delete(key: _tokenKey);
      await _storage.delete(key: _refreshTokenKey);
      await _storage.delete(key: _userKey);
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      final response = await _apiClient.post('/auth/reset-password', data: {
        'email': email,
      });

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}

class AuthResult {
  final bool isSuccess;
  final User? user;
  final String? error;

  const AuthResult._({
    required this.isSuccess,
    this.user,
    this.error,
  });

  factory AuthResult.success(User user) => AuthResult._(
    isSuccess: true,
    user: user,
  );

  factory AuthResult.failure(String error) => AuthResult._(
    isSuccess: false,
    error: error,
  );
}

