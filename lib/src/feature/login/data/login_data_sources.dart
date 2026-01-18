import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp/src/core/provider/dio_provider.dart';
import 'package:stamp/src/feature/login/model/jwt_token_response.dart';

/// {@template login_data_sources}
/// LoginDataSources.
/// {@endtemplate}
abstract interface class LoginDataSources {
  /// {@macro login_data_sources}
  const LoginDataSources();

  Future<JwtTokenResponse> login(String userName, String password);
}

/// {@template login_data_sources}
/// LoginDataSourcesImpl.
/// {@endtemplate}
final class LoginDataSourcesImpl implements LoginDataSources {
  /// {@macro login_data_sources}
  LoginDataSourcesImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<JwtTokenResponse> login(String userName, String password) async {
    final response = await _dio.post(
      '/auth/token/',
      data: {'username': userName, 'password': password},
    );

    return JwtTokenResponse.fromJson(response.data);
  }
}

final loginDataSourcesProvider = Provider<LoginDataSources>((ref) {
  final dio = ref.watch(dioProvider);
  return LoginDataSourcesImpl(dio: dio);
});
