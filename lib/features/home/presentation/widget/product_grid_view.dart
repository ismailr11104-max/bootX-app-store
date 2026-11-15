import 'package:bootx_app/core/wigets/product_item_card.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_bloc.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        // 1. حالة التحميل
        if (state is ProductLoading || state is ProductInitial) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        // 2. حالة حدوث خطأ
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

        // 3. حالة نجاح جلب المنتجات
        if (state is ProductLoaded) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = state.products[index];
                return ProductItemCard(
                  title: product.name,
                  // استبدل بالحقول الخاصة بـ ProductEntity
                  tag: 'BEST SELLER',
                  price: product.price,
                  imageUrl: product.image,
                  onTap: () {
                    // الانتقال لتفاصيل المنتج
                  },
                  onAddTap: () {
                    // إضافة المنتج للسلة
                  },
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
