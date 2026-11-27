import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/wigets/app_empty_view.dart';
import 'package:bootx_app/core/wigets/app_error_view.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_bloc.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_products_list.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }

        if (state is CartError) {
          return AppErrorView(message: state.message);
        }

        if (state is CartLoaded) {
          if (state.cart.items.isEmpty) {
            return const Center(
              child: AppEmptyView(
                title: 'Your Cart is Empty',
                subtitle:
                    'Looks like you haven\'t added any items to your cart yet.',
              ),
            );
          }

          return CartProductsList(cart: state.cart);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
