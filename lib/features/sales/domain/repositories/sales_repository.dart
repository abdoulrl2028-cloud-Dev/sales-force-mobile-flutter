import '../entities/product.dart';
import '../entities/sale.dart';

/// Repositório de vendas
abstract class SalesRepository {
  /// Obtém lista de vendas
  Future<List<Sale>> getSales({
    int page = 1,
    int limit = 20,
    String? status,
  });

  /// Obtém uma venda por ID
  Future<Sale> getSaleById(String id);

  /// Cria uma nova venda
  Future<Sale> createSale({
    required String customerId,
    required String customerName,
    required List<SaleItem> items,
    String? notes,
  });

  /// Atualiza uma venda
  Future<Sale> updateSale({
    required String id,
    String? status,
    String? notes,
  });

  /// Deleta uma venda
  Future<void> deleteSale(String id);

  /// Obtém relatório de vendas
  Future<Map<String, dynamic>> getSalesReport({
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Obtém lista de produtos
  Future<List<Product>> getProducts({
    int page = 1,
    int limit = 20,
    String? category,
  });

  /// Obtém um produto por ID
  Future<Product> getProductById(String id);
}
