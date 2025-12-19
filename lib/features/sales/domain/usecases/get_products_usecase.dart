import '../entities/product.dart';
import '../repositories/sales_repository.dart';

/// Caso de uso: Obter produtos
class GetProductsUseCase {
  final SalesRepository repository;

  const GetProductsUseCase(this.repository);

  Future<List<Product>> call({
    int page = 1,
    int limit = 20,
    String? category,
  }) async {
    return await repository.getProducts(
      page: page,
      limit: limit,
      category: category,
    );
  }
}
