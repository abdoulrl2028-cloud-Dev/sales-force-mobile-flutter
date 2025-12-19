import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../models/user_model.dart';

/// Fonte de dados remota para autenticação
class AuthRemoteDataSource {
  final http.Client client;

  const AuthRemoteDataSource(this.client);

  /// Realiza o login
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.login}'),
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return UserModel.fromJson(data['user'] as Map<String, dynamic>);
    } else {
      throw Exception('Falha ao fazer login');
    }
  }

  /// Realiza o registro
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.register}'),
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return UserModel.fromJson(data['user'] as Map<String, dynamic>);
    } else {
      throw Exception('Falha ao registrar usuário');
    }
  }

  /// Envia email para recuperação de senha
  Future<void> forgotPassword({required String email}) async {
    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.forgotPassword}'),
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
      },
      body: jsonEncode({
        'email': email,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao enviar email de recuperação');
    }
  }

  /// Reseta a senha
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.resetPassword}'),
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
      },
      body: jsonEncode({
        'token': token,
        'new_password': newPassword,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao resetar senha');
    }
  }
}
