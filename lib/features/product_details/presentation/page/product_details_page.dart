import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/services/service_locator/setup_service_locator.dart';
import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/core/wigets/custom_app_bar.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_bloc.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_event.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_state.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_details_body.dart';
import 'package:bootx_app/features/product_details/presentation/widget/product_details_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String detailsRoute = 'product_details';
  final ProductEntity product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProductDetailsBloc>()..add(GetProductDetailsEvent(product.id)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const CustomAppBar(title: 'Product Details'),
        body: ProductDetailsBody(product: product),
        bottomNavigationBar:
            BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
              listenWhen: (previous, current) =>
                  current is ProductDetailsSuccess &&
                  current.isAddedToCart &&
                  (previous is! ProductDetailsSuccess ||
                      !previous.isAddedToCart),
              listener: (context, state) {
                final name = state is ProductDetailsSuccess
                    ? state.product.name
                    : product.name;
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        'The product $name has been added to Cart',
                        style: AppTextStyles.medium14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: AppColors.primary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
              },
              builder: (context, state) {
                final activeProduct = state is ProductDetailsSuccess
                    ? state.product
                    : product;
                return ProductDetailsBottom(
                  product: activeProduct,
                  onAddToCart: state is ProductDetailsSuccess
                      ? () => context.read<ProductDetailsBloc>().add(
                          AddToCartEvent(activeProduct),
                        )
                      : null,
                );
              },
            ),
      ),
    );
  }
}
