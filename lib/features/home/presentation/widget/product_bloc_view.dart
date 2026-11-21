import 'package:bootx_app/core/helper_functions/get_dummy_product.dart';
import 'package:bootx_app/core/wigets/app_error_view.dart';
import 'package:bootx_app/core/wigets/product_grid_view.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_bloc.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductBlocView extends StatelessWidget {
  const ProductBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return ProductGridView(products: state.products);
        }

        if (state is ProductLoading || state is ProductInitial) {
          return SliverSkeletonizer(
            enabled: true,
            child: ProductGridView(products: getDummyProduct),
          );
        }

        if (state is ProductError) {
          return SliverToBoxAdapter(
            child: AppErrorView(message: state.message),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
