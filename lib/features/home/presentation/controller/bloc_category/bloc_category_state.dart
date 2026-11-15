import 'package:bootx_app/features/home/domain/entity/category_entity.dart';
import 'package:equatable/equatable.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

final class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

final class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

final class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  final String selectedCategoryId;

  const CategoryLoaded({
    required this.categories,
    required this.selectedCategoryId,
  });

  @override
  List<Object?> get props => [categories, selectedCategoryId];
}

final class CategoryError extends CategoryState {
  final String message;

  const CategoryError({required this.message});

  @override
  List<Object?> get props => [message];
}
