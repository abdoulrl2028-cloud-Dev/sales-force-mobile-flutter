import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../bloc/products_bloc.dart';

/// Página de produtos
class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(ProductsLoadRequested());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      context.read<ProductsBloc>().add(ProductsLoadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implementar busca
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsLoaded) {
            if (state.products.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 64,
                      color: AppColors.textHint,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Nenhum produto encontrado',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProductsBloc>().add(ProductsRefreshRequested());
              },
              child: GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: state.products.length + (state.hasMore ? 2 : 0),
                itemBuilder: (context, index) {
                  if (index >= state.products.length) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final product = state.products[index];

                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        // Navegar para detalhes do produto
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Imagem do produto
                          Expanded(
                            child: Container(
                              color: AppColors.background,
                              child: product.image != null
                                  ? Image.network(
                                      product.image!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder: (_, __, ___) => Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 48,
                                          color: AppColors.textHint,
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Icon(
                                        Icons.inventory_2_outlined,
                                        size: 48,
                                        color: AppColors.textHint,
                                      ),
                                    ),
                            ),
                          ),
                          // Informações do produto
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: AppTextStyles.labelLarge,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  Formatters.currency(product.price),
                                  style: AppTextStyles.h6.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.inventory_2,
                                      size: 14,
                                      color: product.stock > 0
                                          ? AppColors.success
                                          : AppColors.error,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${product.stock} ${product.stock == 1 ? 'unidade' : 'unidades'}',
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: product.stock > 0
                                            ? AppColors.success
                                            : AppColors.error,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is ProductsFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: AppColors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Erro ao carregar produtos',
                    style: AppTextStyles.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    style: AppTextStyles.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductsBloc>().add(ProductsLoadRequested());
                    },
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
