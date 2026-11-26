import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/wigets/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavouriteLoadingView extends StatelessWidget {
  const FavouriteLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyProducts = List.generate(
      6,
      (index) => ProductEntity(
        id: '$index',
        name: 'Nike Jordan',
        description: 'Placeholder description',
        price: 58.7,
        rating: 4.5,
        image: 'assets/images/avatar.png',
        sizes: const ['40', '41'],
        images: const [],
        categoryId: '1',
      ),
    );

    return Skeletonizer(
      enabled: true,
      child: CustomScrollView(
        slivers: [
          ProductGridView(
            products: dummyProducts,
            isAdded: false,
            isFavorite: true,
          ),
        ],
      ),
    );
  }
}
