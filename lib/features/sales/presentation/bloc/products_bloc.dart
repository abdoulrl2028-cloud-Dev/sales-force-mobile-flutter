import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';

/// Estados de produtos
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  final bool hasMore;

  ProductsLoaded({
    required this.products,
    this.hasMore = true,
  });
}

class ProductsFailure extends ProductsState {
  final String message;
  ProductsFailure(this.message);
}

/// Eventos de produtos
abstract class ProductsEvent {}

class ProductsLoadRequested extends ProductsEvent {
  final String? category;
  ProductsLoadRequested({this.category});
}

class ProductsRefreshRequested extends ProductsEvent {
  final String? category;
  ProductsRefreshRequested({this.category});
}

class ProductsLoadMore extends ProductsEvent {}

/// Bloc de produtos
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductsUseCase;
  int _currentPage = 1;
  String? _currentCategory;

  ProductsBloc({required this.getProductsUseCase}) : super(ProductsInitial()) {
    on<ProductsLoadRequested>(_onProductsLoadRequested);
    on<ProductsRefreshRequested>(_onProductsRefreshRequested);
    on<ProductsLoadMore>(_onProductsLoadMore);
  }

  Future<void> _onProductsLoadRequested(
    ProductsLoadRequested event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());

    try {
      _currentPage = 1;
      _currentCategory = event.category;

      final products = await getProductsUseCase(
        page: _currentPage,
        category: _currentCategory,
      );

      emit(ProductsLoaded(
        products: products,
        hasMore: products.length >= 20,
      ));
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }

  Future<void> _onProductsRefreshRequested(
    ProductsRefreshRequested event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      _currentPage = 1;
      _currentCategory = event.category;

      final products = await getProductsUseCase(
        page: _currentPage,
        category: _currentCategory,
      );

      emit(ProductsLoaded(
        products: products,
        hasMore: products.length >= 20,
      ));
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }

  Future<void> _onProductsLoadMore(
    ProductsLoadMore event,
    Emitter<ProductsState> emit,
  ) async {
    if (state is ProductsLoaded) {
      final currentState = state as ProductsLoaded;

      if (!currentState.hasMore) return;

      try {
        _currentPage++;

        final newProducts = await getProductsUseCase(
          page: _currentPage,
          category: _currentCategory,
        );

        emit(ProductsLoaded(
          products: [...currentState.products, ...newProducts],
          hasMore: newProducts.length >= 20,
        ));
      } catch (e) {
        emit(ProductsFailure(e.toString()));
      }
    }
  }
}
