import 'package:bootx_app/core/model/product_model.dart';
import 'package:bootx_app/features/cart/domain/entities/cart_item_entity.dart';

import '../../domain/entities/cart_entity.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.productId,
    required super.quantity,
    required super.size,
    required super.color,
    required super.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      size: json['size'] as String? ?? '',
      color: json['color'] as String? ?? '',
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );
  }
}

class CartModel extends CartEntity {
  const CartModel({
    required super.items,
    required super.totalItems,
    required super.totalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'] as List? ?? [];
    return CartModel(
      items: rawItems
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: (json['totalItems'] as num?)?.toInt() ?? 0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
