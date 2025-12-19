import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/sale.dart';
import '../../domain/usecases/get_sales_usecase.dart';

/// Estados de vendas
abstract class SalesState {}

class SalesInitial extends SalesState {}

class SalesLoading extends SalesState {}

class SalesLoaded extends SalesState {
  final List<Sale> sales;
  final bool hasMore;

  SalesLoaded({
    required this.sales,
    this.hasMore = true,
  });
}

class SalesFailure extends SalesState {
  final String message;
  SalesFailure(this.message);
}

/// Eventos de vendas
abstract class SalesEvent {}

class SalesLoadRequested extends SalesEvent {
  final String? status;
  SalesLoadRequested({this.status});
}

class SalesRefreshRequested extends SalesEvent {
  final String? status;
  SalesRefreshRequested({this.status});
}

class SalesLoadMore extends SalesEvent {}

/// Bloc de vendas
class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final GetSalesUseCase getSalesUseCase;
  int _currentPage = 1;
  String? _currentStatus;

  SalesBloc({required this.getSalesUseCase}) : super(SalesInitial()) {
    on<SalesLoadRequested>(_onSalesLoadRequested);
    on<SalesRefreshRequested>(_onSalesRefreshRequested);
    on<SalesLoadMore>(_onSalesLoadMore);
  }

  Future<void> _onSalesLoadRequested(
    SalesLoadRequested event,
    Emitter<SalesState> emit,
  ) async {
    emit(SalesLoading());

    try {
      _currentPage = 1;
      _currentStatus = event.status;

      final sales = await getSalesUseCase(
        page: _currentPage,
        status: _currentStatus,
      );

      emit(SalesLoaded(
        sales: sales,
        hasMore: sales.length >= 20,
      ));
    } catch (e) {
      emit(SalesFailure(e.toString()));
    }
  }

  Future<void> _onSalesRefreshRequested(
    SalesRefreshRequested event,
    Emitter<SalesState> emit,
  ) async {
    try {
      _currentPage = 1;
      _currentStatus = event.status;

      final sales = await getSalesUseCase(
        page: _currentPage,
        status: _currentStatus,
      );

      emit(SalesLoaded(
        sales: sales,
        hasMore: sales.length >= 20,
      ));
    } catch (e) {
      emit(SalesFailure(e.toString()));
    }
  }

  Future<void> _onSalesLoadMore(
    SalesLoadMore event,
    Emitter<SalesState> emit,
  ) async {
    if (state is SalesLoaded) {
      final currentState = state as SalesLoaded;

      if (!currentState.hasMore) return;

      try {
        _currentPage++;

        final newSales = await getSalesUseCase(
          page: _currentPage,
          status: _currentStatus,
        );

        emit(SalesLoaded(
          sales: [...currentState.sales, ...newSales],
          hasMore: newSales.length >= 20,
        ));
      } catch (e) {
        emit(SalesFailure(e.toString()));
      }
    }
  }
}
