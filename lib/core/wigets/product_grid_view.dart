import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/wigets/product_item_card.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductEntity> products;
  final ValueChanged<ProductEntity>? onProductTap;
  final ValueChanged<ProductEntity>? onFavoriteTap;
  final bool Function(ProductEntity product)? isProductFavorite;
  final bool isAdded;
  final bool isFavorite;

  const ProductGridView({
    super.key,
    required this.products,
    this.onProductTap,
    this.onFavoriteTap,
    this.isProductFavorite,
    this.isAdded = true,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          final product = products[index];
          return ProductItemCard(
            productEntity: product,
            isAdded: isAdded,
            isFavorite: isProductFavorite?.call(product) ?? isFavorite,
            onFavoriteTap: () => onFavoriteTap?.call(product),
            onAddTap: () {},
          );
        }, childCount: products.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 21,
          childAspectRatio: 0.75,
        ),
      ),
    );
  }
}
