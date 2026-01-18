import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stamp/src/feature/login/model/jwt_token_response.dart';

/// {@template jwt_token_storage}
/// JwtTokenStorage.
/// {@endtemplate}
abstract interface class JwtTokenStorage {
  /// {@macro jwt_token_storage}

  Future<void> setJwt(JwtTokenResponse jwtTokenResponse);

  FutureOr<JwtTokenResponse?> getJwt();

  Future<void> deleteJwt(JwtTokenResponse jwtTokenResponse);
}

/// {@template jwt_token_storage}
/// JwtTokenStorageImpl.
/// {@endtemplate}
final class JwtTokenStorageImpl implements JwtTokenStorage {
  /// {@macro jwt_token_storage}
  JwtTokenStorageImpl({required FlutterSecureStorage secureStorage})
    : _secureStorage = secureStorage;

  final FlutterSecureStorage _secureStorage;

  static const _jwtKey = 'jwt_token';

  @override
  Future<void> deleteJwt(JwtTokenResponse jwtTokenResponse) async {
    await _secureStorage.delete(key: _jwtKey);
  }

  @override
  FutureOr<JwtTokenResponse?> getJwt() async {
    final jwtStr = await _secureStorage.read(key: _jwtKey);

    if (jwtStr == null) return null;

    return jwtTokenResponseFromJson(jwtStr);
  }

  @override
  Future<void> setJwt(JwtTokenResponse jwtTokenResponse) async =>
      await _secureStorage.write(
        key: _jwtKey,
        value: jwtTokenResponseToJson(jwtTokenResponse),
      );
}

final jwtTokenStorageProvider = Provider<JwtTokenStorage>((ref) {
  return JwtTokenStorageImpl(secureStorage: const FlutterSecureStorage());
});
