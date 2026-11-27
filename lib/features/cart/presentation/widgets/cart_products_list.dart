import 'package:bootx_app/features/cart/domain/entities/cart_entity.dart';
import 'package:bootx_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_bloc.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_cart_item.dart';

class CartProductsList extends StatelessWidget {
  final CartEntity cart;

  const CartProductsList({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 20),
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        final item = cart.items[index];

        return ProductCartItem(
          item: item,
          onIncrement: () => _updateQuantity(context, item, item.quantity + 1),
          onDecrement: () => _updateQuantity(context, item, item.quantity - 1),
          onDelete: () {
            context.read<CartBloc>().add(RemoveItemEvent(item.productId));
          },
        );
      },
    );
  }

  void _updateQuantity(
    BuildContext context,
    CartItemEntity item,
    int quantity,
  ) {
    context.read<CartBloc>().add(
      UpdateItemQuantityEvent(
        productId: item.productId,
        newQuantity: quantity,
        size: item.size,
        color: item.color,
      ),
    );
  }
}
