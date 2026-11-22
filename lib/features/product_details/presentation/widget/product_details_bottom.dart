import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/core/wigets/custom_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsBottom extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onAddToCart;

  const ProductDetailsBottom({
    super.key,
    required this.product,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Price',
                  style: AppTextStyles.regular16.copyWith(
                    color: AppColors.textLightSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price}',
                  style: AppTextStyles.medium20.copyWith(
                    color: AppColors.textLightPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 36),
            Expanded(
              child: CustomButton(text: 'Add To Cart', onPressed: onAddToCart),
            ),
          ],
        ),
      ),
    );
  }
}
