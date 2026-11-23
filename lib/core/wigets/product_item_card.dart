import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/core/wigets/custom_network_image.dart';
import 'package:bootx_app/features/product_details/presentation/page/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductItemCard extends StatelessWidget {
  final String? tag;
  final ProductEntity productEntity;
  final VoidCallback? onAddTap;

  const ProductItemCard({
    super.key,
    this.tag = 'BEST SELLER',
    this.onAddTap,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ProductDetailsPage.detailsRoute, arguments: productEntity.id),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 6,
                  top: 6,
                  right: 6,
                  left: 6,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CustomNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    imageUrl: productEntity.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (tag != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  tag!.toUpperCase(),
                  style: AppTextStyles.medium12.copyWith(
                    color: AppColors.primary,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                productEntity.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.medium18.copyWith(
                  color: AppColors.textLightPrimary,
                  letterSpacing: -0.3,
                ),
              ),
            ),

            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, bottom: 14.0),
                  child: Text(
                    "${productEntity.price}",
                    style: AppTextStyles.medium16.copyWith(
                      color: AppColors.textLightPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Skeleton.leaf(
                  child: GestureDetector(
                    onTap: onAddTap,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0xFF5B9EE1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
