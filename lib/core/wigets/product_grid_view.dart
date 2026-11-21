import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/wigets/product_item_card.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductEntity> products;

  const ProductGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          final product = products[index];
          return ProductItemCard(
            tag: 'BEST SELLER',
            productEntity: product,
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
