import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_bloc.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_state.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_gallery_section.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_image_showcase.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_info_section.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_size_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductDetailsError) {
          return Center(child: Text(state.message));
        }

        if (state is ProductDetailsSuccess) {
          final product = state.product;

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
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
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

        return const SizedBox.shrink();
      },
    );
  }
}
