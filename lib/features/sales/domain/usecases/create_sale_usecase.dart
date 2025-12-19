import '../entities/sale.dart';
import '../repositories/sales_repository.dart';

/// Caso de uso: Criar venda
class CreateSaleUseCase {
  final SalesRepository repository;

  const CreateSaleUseCase(this.repository);

  Future<Sale> call({
    required String customerId,
    required String customerName,
    required List<SaleItem> items,
    String? notes,
  }) async {
    // Validações
    if (items.isEmpty) {
      throw Exception('A venda deve ter pelo menos um item');
    }

    // Calcula o total
    double totalAmount = items.fold(0, (sum, item) => sum + item.subtotal);

    return await repository.createSale(
      customerId: customerId,
      customerName: customerName,
      items: items,
      notes: notes,
    );
  }
}
