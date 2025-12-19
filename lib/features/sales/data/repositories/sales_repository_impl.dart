import '../../domain/entities/product.dart';
import '../../domain/entities/sale.dart';
import '../../domain/repositories/sales_repository.dart';
import '../datasources/sales_remote_datasource.dart';
import '../models/sale_model.dart';

/// Implementação do repositório de vendas
class SalesRepositoryImpl implements SalesRepository {
  final SalesRemoteDataSource remoteDataSource;

  const SalesRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Sale>> getSales({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    try {
      final salesModels = await remoteDataSource.getSales(
        page: page,
        limit: limit,
        status: status,
      );
      return salesModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Erro ao buscar vendas: $e');
    }
  }

  @override
  Future<Sale> getSaleById(String id) async {
    try {
      final saleModel = await remoteDataSource.getSaleById(id);
      return saleModel.toEntity();
    } catch (e) {
      throw Exception('Erro ao buscar venda: $e');
    }
  }

  @override
  Future<Sale> createSale({
    required String customerId,
    required String customerName,
    required List<SaleItem> items,
    String? notes,
  }) async {
    try {
      final itemModels = items
          .map((item) => SaleItemModel.fromEntity(item))
          .toList();

      final saleModel = await remoteDataSource.createSale(
        customerId: customerId,
        customerName: customerName,
        items: itemModels,
        notes: notes,
      );

      return saleModel.toEntity();
    } catch (e) {
      throw Exception('Erro ao criar venda: $e');
    }
  }

  @override
  Future<Sale> updateSale({
    required String id,
    String? status,
    String? notes,
  }) async {
    // Implementar lógica de atualização
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSale(String id) async {
    // Implementar lógica de exclusão
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getSalesReport({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    // Implementar lógica de relatório
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts({
    int page = 1,
    int limit = 20,
    String? category,
  }) async {
    try {
      final productModels = await remoteDataSource.getProducts(
        page: page,
        limit: limit,
        category: category,
      );
      return productModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Erro ao buscar produtos: $e');
    }
  }

  @override
  Future<Product> getProductById(String id) async {
    try {
      final productModel = await remoteDataSource.getProductById(id);
      return productModel.toEntity();
    } catch (e) {
      throw Exception('Erro ao buscar produto: $e');
    }
  }
}
