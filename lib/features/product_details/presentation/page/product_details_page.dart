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

  final String productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProductDetailsBloc>()..add(GetProductDetailsEvent(productId)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const CustomAppBar(title: 'Product Details'),
        body: const ProductDetailsBody(),
        bottomNavigationBar: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
          listenWhen: (previous, current) =>
              current is ProductDetailsSuccess &&
              current.isAddedToCart &&
              (previous is! ProductDetailsSuccess || !previous.isAddedToCart),
          listener: (context, state) {
            if (state is ProductDetailsSuccess && state.isAddedToCart) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      'The product ${state.product.name} has been added to Cart',
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
            }
          },
          builder: (context, state) {
            if (state is! ProductDetailsSuccess) {
              return const SizedBox.shrink();
            }

            return ProductDetailsBottom(
              product: state.product,
              onAddToCart: () {
                context.read<ProductDetailsBloc>().add(
                  AddToCartEvent(state.product),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
