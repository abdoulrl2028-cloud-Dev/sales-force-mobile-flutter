import '../repositories/auth_repository.dart';

/// Caso de uso: Logout
class LogoutUseCase {
  final AuthRepository repository;

  const LogoutUseCase(this.repository);

  Future<void> call() async {
    return await repository.logout();
  }
}
