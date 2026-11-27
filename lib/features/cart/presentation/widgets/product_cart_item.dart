import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/core/wigets/custom_network_image.dart';
import 'package:bootx_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:bootx_app/features/cart/presentation/widgets/delete_item_cart.dart';
import 'package:flutter/material.dart';

import 'cart_quantity_counter.dart';

class ProductCartItem extends StatelessWidget {
  final CartItemEntity item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const ProductCartItem({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 85,
            height: 85,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CustomNetworkImage(imageUrl: item.product.image),
          ),
          const SizedBox(width: 14),
          Expanded(child: _buildDetails()),
          DeleteItemCart(
            size: item.size,
            onDelete: () {
              onDelete();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.medium16.copyWith(
            color: AppColors.textLightPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${item.product.price.toStringAsFixed(2)}',
          style: AppTextStyles.medium14.copyWith(
            color: AppColors.textLightPrimary,
          ),
        ),
        const SizedBox(height: 10),
        CartQuantityCounter(
          quantity: item.quantity,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
        ),
      ],
    );
  }
}
