import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp/src/feature/login/model/jwt_token_response.dart';
import 'login_data_sources.dart';

/// {@template login_repository}
/// LoginRepository.
/// {@endtemplate}
abstract interface class LoginRepository {
  /// {@macro login_repository}
  const LoginRepository();

  Future<JwtTokenResponse> login(String userName, String password);
}

/// {@template login_repository_impl}
/// LoginRepositoryImpl.
/// {@endtemplate}
final class LoginRepositoryImpl implements LoginRepository {
  /// {@macro login_repository_impl}
  LoginRepositoryImpl({required LoginDataSources dataSources})
    : _dataSources = dataSources;

  final LoginDataSources _dataSources;

  @override
  Future<JwtTokenResponse> login(String userName, String password) =>
      _dataSources.login(userName, password);
}

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final dataSources = ref.watch(loginDataSourcesProvider);
  return LoginRepositoryImpl(dataSources: dataSources);
});
