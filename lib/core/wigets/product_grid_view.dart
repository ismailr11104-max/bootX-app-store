import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/wigets/product_item_card.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_bloc.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, List<ProductEntity> products = const []});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading || state is ProductInitial) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }
        if (state is ProductError) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          );
        }

        if (state is ProductLoaded) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = state.products[index];
                return ProductItemCard(
                  tag: 'BEST SELLER',
                  productEntity: product,
                  onAddTap: () {},
                );
              }, childCount: state.products.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 21,
                childAspectRatio: 0.75,
              ),
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
