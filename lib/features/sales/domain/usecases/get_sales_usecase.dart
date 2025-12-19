import '../entities/sale.dart';
import '../repositories/sales_repository.dart';

/// Caso de uso: Obter vendas
class GetSalesUseCase {
  final SalesRepository repository;

  const GetSalesUseCase(this.repository);

  Future<List<Sale>> call({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    return await repository.getSales(
      page: page,
      limit: limit,
      status: status,
    );
  }
}
