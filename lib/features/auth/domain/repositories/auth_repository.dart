import '../entities/user.dart';

/// Repositório de autenticação
abstract class AuthRepository {
  /// Realiza o login do usuário
  Future<User> login({
    required String email,
    required String password,
  });

  /// Realiza o logout do usuário
  Future<void> logout();

  /// Registra um novo usuário
  Future<User> register({
    required String name,
    required String email,
    required String password,
  });

  /// Envia email para recuperação de senha
  Future<void> forgotPassword({required String email});

  /// Reseta a senha do usuário
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  });

  /// Obtém o usuário atual
  Future<User?> getCurrentUser();

  /// Verifica se o usuário está autenticado
  Future<bool> isAuthenticated();

  /// Atualiza o token de autenticação
  Future<void> refreshToken();
}
