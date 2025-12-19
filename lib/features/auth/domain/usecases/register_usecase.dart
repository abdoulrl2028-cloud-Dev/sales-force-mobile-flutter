import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Caso de uso: Registro
class RegisterUseCase {
  final AuthRepository repository;

  const RegisterUseCase(this.repository);

  Future<User> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return await repository.register(
      name: name,
      email: email,
      password: password,
    );
  }
}
