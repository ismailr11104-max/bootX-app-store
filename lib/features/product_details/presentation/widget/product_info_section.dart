import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductEntity product;

  const ProductInfoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: AppTextStyles.medium24.copyWith(
            color: AppColors.textLightPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '\$${product.price}',
          style: AppTextStyles.medium20.copyWith(
            color: AppColors.textLightPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.textLightSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
