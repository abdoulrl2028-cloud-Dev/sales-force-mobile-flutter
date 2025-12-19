import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../models/product_model.dart';
import '../models/sale_model.dart';

/// Fonte de dados remota para vendas
class SalesRemoteDataSource {
  final http.Client client;

  const SalesRemoteDataSource(this.client);

  /// Obtém lista de vendas
  Future<List<SaleModel>> getSales({
    int page = 1,
    int limit = 20,
    String? status,
  }) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.sales}')
        .replace(queryParameters: {
      'page': page.toString(),
      'limit': limit.toString(),
      if (status != null) 'status': status,
    });

    final response = await client.get(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final salesList = data['sales'] as List;
      return salesList
          .map((sale) => SaleModel.fromJson(sale as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Falha ao buscar vendas');
    }
  }

  /// Obtém uma venda por ID
  Future<SaleModel> getSaleById(String id) async {
    final uri = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.salesById.replaceAll('{id}', id)}',
    );

    final response = await client.get(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return SaleModel.fromJson(data['sale'] as Map<String, dynamic>);
    } else {
      throw Exception('Falha ao buscar venda');
    }
  }

  /// Cria uma nova venda
  Future<SaleModel> createSale({
    required String customerId,
    required String customerName,
    required List<SaleItemModel> items,
    String? notes,
  }) async {
    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.createSale}'),
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
      },
      body: jsonEncode({
        'customer_id': customerId,
        'customer_name': customerName,
        'items': items.map((item) => item.toJson()).toList(),
        'notes': notes,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return SaleModel.fromJson(data['sale'] as Map<String, dynamic>);
    } else {
      throw Exception('Falha ao criar venda');
    }
  }

  /// Obtém lista de produtos
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int limit = 20,
    String? category,
  }) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.products}')
        .replace(queryParameters: {
      'page': page.toString(),
      'limit': limit.toString(),
      if (category != null) 'category': category,
    });

    final response = await client.get(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final productsList = data['products'] as List;
      return productsList
          .map(
            (product) => ProductModel.fromJson(product as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception('Falha ao buscar produtos');
    }
  }

  /// Obtém um produto por ID
  Future<ProductModel> getProductById(String id) async {
    final uri = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.productById.replaceAll('{id}', id)}',
    );

    final response = await client.get(
      uri,
      headers: {
        ApiConstants.headerContentType: ApiConstants.contentTypeJson,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return ProductModel.fromJson(data['product'] as Map<String, dynamic>);
    } else {
      throw Exception('Falha ao buscar produto');
    }
  }
}
