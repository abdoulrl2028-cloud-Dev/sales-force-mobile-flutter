/// Entidade de produto
class Product {
  final String id;
  final String name;
  final String? description;
  final double price;
  final String? image;
  final int stock;
  final String category;
  final DateTime createdAt;

  const Product({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.image,
    required this.stock,
    required this.category,
    required this.createdAt,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? image,
    int? stock,
    String? category,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      stock: stock ?? this.stock,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.image == image &&
        other.stock == stock &&
        other.category == category &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        image.hashCode ^
        stock.hashCode ^
        category.hashCode ^
        createdAt.hashCode;
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, stock: $stock)';
  }
}
