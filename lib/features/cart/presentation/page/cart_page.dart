import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/wigets/custom_app_bar.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_bloc.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_state.dart';
import 'package:bootx_app/features/cart/presentation/widgets/cart_body.dart';
import 'package:bootx_app/features/cart/presentation/widgets/cart_clear_button.dart';
import 'package:bootx_app/features/cart/presentation/widgets/cart_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final hasItems = state is CartLoaded && state.cart.items.isNotEmpty;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: CustomAppBar(
            title: 'My Cart',
            showBackButton: false,
            trailing: hasItems ? const CartClearButton() : null,
          ),
          body: const CartBody(),
          bottomNavigationBar: hasItems
              ? CartSummaryCard(cart: (state).cart, onCheckout: () {})
              : null,
        );
      },
    );
  }
}
