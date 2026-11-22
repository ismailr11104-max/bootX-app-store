import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_gallery_section.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_image_showcase.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_info_section.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_size_section.dart';
import 'package:flutter/material.dart';

class ProductDetailsBody extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final gallery = product.images.isNotEmpty
        ? product.images
        : [product.image];

    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageShowcase(images: gallery),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfoSection(product: product),
                const SizedBox(height: 18),
                ProductGallerySection(images: gallery),
                const SizedBox(height: 18),
                ProductSizeSection(sizes: product.sizes),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
