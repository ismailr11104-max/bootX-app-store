import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object?> get props => [];
}

final class GetProductDetailsEvent extends ProductDetailsEvent {
  final String productId;

  const GetProductDetailsEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

final class SelectImageEvent extends ProductDetailsEvent {
  final int index;

  const SelectImageEvent(this.index);

  @override
  List<Object?> get props => [index];
}

final class SelectSizeEvent extends ProductDetailsEvent {
  final int index;

  const SelectSizeEvent(this.index);

  @override
  List<Object?> get props => [index];
}

final class AddToCartEvent extends ProductDetailsEvent {
  final ProductEntity product;

  const AddToCartEvent(this.product);

  @override
  List<Object?> get props => [product];
}
