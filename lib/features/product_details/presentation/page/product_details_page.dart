import 'package:bootx_app/core/helper_functions/build_bar.dart';
import 'package:bootx_app/core/services/service_locator/setup_service_locator.dart';
import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/wigets/custom_app_bar.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_bloc.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_event.dart';
import 'package:bootx_app/features/cart/presentation/controller/cart_state.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_bloc.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_event.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_state.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_details_body.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_details_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String detailsRoute = 'product_details';

  final String productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProductDetailsBloc>()..add(GetProductDetailsEvent(productId)),
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartLoaded && state.message != null) {
            ShowBar(context, state.message!);
          }
          if (state is CartError) {
            ShowBar(context, state.message, backgroundColor: Colors.red);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: const CustomAppBar(title: 'Product Details'),
          body: const ProductDetailsBody(),
          bottomNavigationBar:
              BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
                builder: (context, state) {
                  if (state is! ProductDetailsSuccess) {
                    return const SizedBox.shrink();
                  }

                  return ProductDetailsBottom(
                    product: state.product,
                    onAddToCart: () {
                      context.read<CartBloc>().add(
                        AddProductToCartEvent(
                          productId: state.product.id,
                          quantity: 1,
                          product: state.product,
                        ),
                      );
                    },
                  );
                },
              ),
        ),
      ),
    );
  }
}
