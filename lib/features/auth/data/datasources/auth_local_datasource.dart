import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/user_model.dart';

/// Fonte de dados local para autenticação
class AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  const AuthLocalDataSource(this.sharedPreferences);

  /// Salva o token de autenticação
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString(AppConstants.keyToken, token);
  }

  /// Obtém o token de autenticação
  Future<String?> getToken() async {
    return sharedPreferences.getString(AppConstants.keyToken);
  }

  /// Remove o token de autenticação
  Future<void> removeToken() async {
    await sharedPreferences.remove(AppConstants.keyToken);
  }

  /// Salva o usuário atual
  Future<void> saveUser(UserModel user) async {
    await sharedPreferences.setString(
      AppConstants.keyUserId,
      user.id,
    );
    await sharedPreferences.setString(
      AppConstants.keyUserEmail,
      user.email,
    );
    await sharedPreferences.setString(
      AppConstants.keyUserName,
      user.name,
    );
  }

  /// Obtém o usuário atual
  Future<UserModel?> getUser() async {
    final userId = sharedPreferences.getString(AppConstants.keyUserId);
    final userEmail = sharedPreferences.getString(AppConstants.keyUserEmail);
    final userName = sharedPreferences.getString(AppConstants.keyUserName);

    if (userId != null && userEmail != null && userName != null) {
      return UserModel(
        id: userId,
        name: userName,
        email: userEmail,
        createdAt: DateTime.now(),
      );
    }

    return null;
  }

  /// Remove o usuário atual
  Future<void> removeUser() async {
    await sharedPreferences.remove(AppConstants.keyUserId);
    await sharedPreferences.remove(AppConstants.keyUserEmail);
    await sharedPreferences.remove(AppConstants.keyUserName);
  }

  /// Verifica se o usuário está autenticado
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  /// Limpa todos os dados de autenticação
  Future<void> clearAuthData() async {
    await removeToken();
    await removeUser();
  }
}
