import '../../domain/entities/user.dart';

/// Modelo de usuário para a camada de dados
class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final DateTime createdAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatar,
    required this.createdAt,
  });

  /// Converte o modelo para entidade
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      phone: phone,
      avatar: avatar,
      createdAt: createdAt,
    );
  }

  /// Cria um modelo a partir de uma entidade
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      avatar: user.avatar,
      createdAt: user.createdAt,
    );
  }

  /// Cria um modelo a partir de JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// Converte o modelo para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'created_at': createdAt.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
