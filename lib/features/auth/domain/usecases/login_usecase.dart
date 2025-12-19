import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Caso de uso: Login
class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  Future<User> call({
    required String email,
    required String password,
  }) async {
    return await repository.login(email: email, password: password);
  }
}
