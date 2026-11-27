import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/core/wigets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/cart_entity.dart';

class CartSummaryCard extends StatelessWidget {
  final CartEntity cart;
  final VoidCallback onCheckout;

  const CartSummaryCard({
    super.key,
    required this.cart,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: AppTextStyles.medium16),
              Text(
                '\$${cart.subtotal.toStringAsFixed(2)}',
                style: AppTextStyles.medium16,
              ),
            ],
          ),

          if (cart.discountAmount > 0) const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount (${(cart.discountPercentage * 100).toInt()}%)',
                style: AppTextStyles.medium16,
              ),
              Text(
                '-\$${cart.discountAmount.toStringAsFixed(2)}',
                style: AppTextStyles.medium16.copyWith(color: Colors.green),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping', style: AppTextStyles.medium16),
              Text(
                '\$${cart.shippingCost.toStringAsFixed(2)}',
                style: AppTextStyles.medium16,
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: AppColors.lightBlue),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Cost',
                style: AppTextStyles.medium16.copyWith(
                  color: AppColors.textLightPrimary,
                ),
              ),
              Text(
                '\$${cart.finalTotal.toStringAsFixed(2)}',
                style: AppTextStyles.medium20,
              ),
            ],
          ),

          const SizedBox(height: 22),

          CustomButton(
            text: 'Checkout',
            onPressed: cart.items.isEmpty ? null : onCheckout,
          ),
        ],
      ),
    );
  }
}
