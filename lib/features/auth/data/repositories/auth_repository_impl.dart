import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

/// Implementação do repositório de autenticação
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.login(
        email: email,
        password: password,
      );

      // Salva o usuário e token localmente
      await localDataSource.saveUser(userModel);
      // Aqui você salvaria o token recebido da API
      // await localDataSource.saveToken(token);

      return userModel.toEntity();
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await localDataSource.clearAuthData();
    } catch (e) {
      throw Exception('Erro ao fazer logout: $e');
    }
  }

  @override
  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      );

      // Salva o usuário e token localmente
      await localDataSource.saveUser(userModel);
      // Aqui você salvaria o token recebido da API
      // await localDataSource.saveToken(token);

      return userModel.toEntity();
    } catch (e) {
      throw Exception('Erro ao registrar: $e');
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      await remoteDataSource.forgotPassword(email: email);
    } catch (e) {
      throw Exception('Erro ao enviar email de recuperação: $e');
    }
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      await remoteDataSource.resetPassword(
        token: token,
        newPassword: newPassword,
      );
    } catch (e) {
      throw Exception('Erro ao resetar senha: $e');
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final userModel = await localDataSource.getUser();
      return userModel?.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      return await localDataSource.isAuthenticated();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> refreshToken() async {
    // Implementar lógica de refresh token
    throw UnimplementedError();
  }
}
