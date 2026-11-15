import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

final class ProductInitial extends ProductState {
  const ProductInitial();
}

final class ProductLoading extends ProductState {
  const ProductLoading();
}

final class ProductLoaded extends ProductState {
  final List<ProductEntity> products;

  const ProductLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

final class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object?> get props => [message];
}
