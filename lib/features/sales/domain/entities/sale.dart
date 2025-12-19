/// Entidade de venda
class Sale {
  final String id;
  final String customerId;
  final String customerName;
  final List<SaleItem> items;
  final double totalAmount;
  final String status;
  final String? notes;
  final DateTime createdAt;
  final DateTime? completedAt;

  const Sale({
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

  Sale copyWith({
    String? id,
    String? customerId,
    String? customerName,
    List<SaleItem>? items,
    double? totalAmount,
    String? status,
    String? notes,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return Sale(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sale &&
        other.id == id &&
        other.customerId == customerId &&
        other.customerName == customerName &&
        other.totalAmount == totalAmount &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        customerId.hashCode ^
        customerName.hashCode ^
        totalAmount.hashCode ^
        status.hashCode;
  }

  @override
  String toString() {
    return 'Sale(id: $id, customer: $customerName, total: $totalAmount, status: $status)';
  }
}

/// Item de venda
class SaleItem {
  final String productId;
  final String productName;
  final double price;
  final int quantity;
  final double subtotal;

  const SaleItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.subtotal,
  });

  SaleItem copyWith({
    String? productId,
    String? productName,
    double? price,
    int? quantity,
    double? subtotal,
  }) {
    return SaleItem(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SaleItem &&
        other.productId == productId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return productId.hashCode ^ quantity.hashCode;
  }
}
