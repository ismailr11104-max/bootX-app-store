import 'package:bootx_app/features/home/domain/usecase/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_category_event.dart';
import 'bloc_category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryBloc({required this.getCategoriesUseCase})
    : super(const CategoryInitial()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<SelectCategoryEvent>(_onSelectCategory);
  }

  Future<void> _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryLoading());

    final result = await getCategoriesUseCase();

    result.fold(
      (failure) {
        emit(CategoryError(message: failure.message));
      },
      (categories) {
        emit(
          CategoryLoaded(
            categories: categories,
            selectedCategoryId: categories.isNotEmpty
                ? 'all'
                : '',
          ),
        );
      },
    );
  }

  void _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<CategoryState> emit,
  ) {
    final currentState = state;

    if (currentState is CategoryLoaded) {
      emit(
        CategoryLoaded(
          categories: currentState.categories,
          selectedCategoryId: event.categoryId,
        ),
      );
    }
  }
}
