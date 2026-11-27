import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final String productId;
  final int quantity;
  final String size;
  final String color;
  final ProductEntity product;

  const CartItemEntity({
    required this.productId,
    required this.quantity,
    required this.size,
    required this.color,
    required this.product,
  });

  CartItemEntity copyWith({int? quantity}) => CartItemEntity(
    productId: productId,
    quantity: quantity ?? this.quantity,
    size: size,
    color: color,
    product: product,
  );

  @override
  List<Object?> get props => [productId, quantity, size, color, product];
}
