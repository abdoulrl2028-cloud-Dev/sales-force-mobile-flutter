import '../../domain/entities/sale.dart';

/// Modelo de venda para a camada de dados
class SaleModel {
  final String id;
  final String customerId;
  final String customerName;
  final List<SaleItemModel> items;
  final double totalAmount;
  final String status;
  final String? notes;
  final DateTime createdAt;
  final DateTime? completedAt;

  const SaleModel({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.items,
    required this.totalAmount,
    required this.status,
    this.notes,
    required this.createdAt,
    this.completedAt,
  });

  /// Converte o modelo para entidade
  Sale toEntity() {
    return Sale(
      id: id,
      customerId: customerId,
      customerName: customerName,
      items: items.map((item) => item.toEntity()).toList(),
      totalAmount: totalAmount,
      status: status,
      notes: notes,
      createdAt: createdAt,
      completedAt: completedAt,
    );
  }

  /// Cria um modelo a partir de uma entidade
  factory SaleModel.fromEntity(Sale sale) {
    return SaleModel(
      id: sale.id,
      customerId: sale.customerId,
      customerName: sale.customerName,
      items: sale.items
          .map((item) => SaleItemModel.fromEntity(item))
          .toList(),
      totalAmount: sale.totalAmount,
      status: sale.status,
      notes: sale.notes,
      createdAt: sale.createdAt,
      completedAt: sale.completedAt,
    );
  }

  /// Cria um modelo a partir de JSON
  factory SaleModel.fromJson(Map<String, dynamic> json) {
    return SaleModel(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      items: (json['items'] as List)
          .map((item) => SaleItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      status: json['status'] as String,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null,
    );
  }

  /// Converte o modelo para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customerId,
      'customer_name': customerName,
      'items': items.map((item) => item.toJson()).toList(),
      'total_amount': totalAmount,
      'status': status,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }
}

/// Modelo de item de venda
class SaleItemModel {
  final String productId;
  final String productName;
  final double price;
  final int quantity;
  final double subtotal;

  const SaleItemModel({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.subtotal,
  });

  /// Converte o modelo para entidade
  SaleItem toEntity() {
    return SaleItem(
      productId: productId,
      productName: productName,
      price: price,
      quantity: quantity,
      subtotal: subtotal,
    );
  }

  /// Cria um modelo a partir de uma entidade
  factory SaleItemModel.fromEntity(SaleItem item) {
    return SaleItemModel(
      productId: item.productId,
      productName: item.productName,
      price: item.price,
      quantity: item.quantity,
      subtotal: item.subtotal,
    );
  }

  /// Cria um modelo a partir de JSON
  factory SaleItemModel.fromJson(Map<String, dynamic> json) {
    return SaleItemModel(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      subtotal: (json['subtotal'] as num).toDouble(),
    );
  }

  /// Converte o modelo para JSON
  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'price': price,
      'quantity': quantity,
      'subtotal': subtotal,
    };
  }
}
