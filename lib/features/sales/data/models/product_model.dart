import '../../domain/entities/product.dart';

/// Modelo de produto para a camada de dados
class ProductModel {
  final String id;
  final String name;
  final String? description;
  final double price;
  final String? image;
  final int stock;
  final String category;
  final DateTime createdAt;

  const ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.image,
    required this.stock,
    required this.category,
    required this.createdAt,
  });

  /// Converte o modelo para entidade
  Product toEntity() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      image: image,
      stock: stock,
      category: category,
      createdAt: createdAt,
    );
  }

  /// Cria um modelo a partir de uma entidade
  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      image: product.image,
      stock: product.stock,
      category: product.category,
      createdAt: product.createdAt,
    );
  }

  /// Cria um modelo a partir de JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String?,
      stock: json['stock'] as int,
      category: json['category'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// Converte o modelo para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'stock': stock,
      'category': category,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
