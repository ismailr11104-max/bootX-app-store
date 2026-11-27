import 'dart:math';

import 'package:bootx_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> items;
  final int totalItems;
  final double totalPrice;

  const CartEntity({
    required this.items,
    required this.totalItems,
    required this.totalPrice,
  });

  CartEntity copyWith({
    List<CartItemEntity>? items,
    int? totalItems,
    double? totalPrice,
  }) {
    return CartEntity(
      items: items ?? this.items,
      totalItems: totalItems ?? this.totalItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  static const double _discountThreshold = 100.0;
  static const double _discountRate = 0.01;
  static const double _maxDiscount = 0.1;
  static const double _shippingFee = 40.0;

  double get subtotal => items.fold(
    0.0,
    (sum, item) => sum + (item.product.price * item.quantity),
  );

  double get discountPercentage {
    final total = subtotal;

    if (total <= _discountThreshold) return 0.0;

    final hundredsCount = (total / _discountThreshold).floor();

    final discount = hundredsCount * _discountRate;

    return min(discount, _maxDiscount);
  }

  double get discountAmount => subtotal * discountPercentage;

  double get shippingCost => items.isEmpty ? 0.0 : _shippingFee;

  double get finalTotal => subtotal - discountAmount + shippingCost;

  @override
  List<Object> get props => [items, totalItems, totalPrice];
}
