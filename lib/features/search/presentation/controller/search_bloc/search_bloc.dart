import 'package:bootx_app/features/search/domain/usecase/search_history_usecases.dart';
import 'package:bootx_app/features/search/domain/usecase/search_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchProductsUseCase searchProductsUseCase;
  final GetSearchHistoryUseCase getSearchHistoryUseCase;
  final SaveSearchQueryUseCase saveSearchQueryUseCase;
  final DeleteSearchQueryUseCase deleteSearchQueryUseCase;

  SearchBloc({
    required this.searchProductsUseCase,
    required this.getSearchHistoryUseCase,
    required this.saveSearchQueryUseCase,
    required this.deleteSearchQueryUseCase,
  }) : super(const SearchInitial()) {
    on<LoadSearchHistoryEvent>(_onLoadSearchHistory);

    on<SearchProductsEvent>(_onSearchProducts);

    on<DeleteSearchHistoryEvent>(_onDeleteSearchHistory);

    add(const LoadSearchHistoryEvent());
  }

  Future<void> _onLoadSearchHistory(
    LoadSearchHistoryEvent event,
    Emitter<SearchState> emit,
  ) async {
    final result = await getSearchHistoryUseCase();

    result.fold(
      (failure) {
        emit(SearchError(message: failure.message, history: state.history));
      },
      (history) {
        emit(SearchInitial(history: history));
      },
    );
  }

  Future<void> _onSearchProducts(
    SearchProductsEvent event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      add(const LoadSearchHistoryEvent());
      return;
    }

    final currentHistory = state.history;

    emit(SearchLoading(history: currentHistory));

    await saveSearchQueryUseCase(query);

    final historyResult = await getSearchHistoryUseCase();

    final updatedHistory = historyResult.fold(
      (failure) => currentHistory,
      (history) => history,
    );

    final result = await searchProductsUseCase(query);

    result.fold(
      (failure) {
        emit(SearchError(message: failure.message, history: updatedHistory));
      },
      (products) {
        if (products.isEmpty) {
          emit(SearchEmpty(query: query, history: updatedHistory));
        } else {
          emit(
            SearchSuccess(
              products: products,
              query: query,
              history: updatedHistory,
            ),
          );
        }
      },
    );
  }

  Future<void> _onDeleteSearchHistory(
    DeleteSearchHistoryEvent event,
    Emitter<SearchState> emit,
  ) async {
    final result = await deleteSearchQueryUseCase(event.query);

    await result.fold(
      (failure) async {
        emit(SearchError(message: failure.message, history: state.history));
      },
      (_) async {
        final historyResult = await getSearchHistoryUseCase();
        historyResult.fold(
          (failure) {
            emit(SearchError(message: failure.message, history: state.history));
          },
          (history) {
            emit(SearchInitial(history: history));
          },
        );
      },
    );
  }
}
