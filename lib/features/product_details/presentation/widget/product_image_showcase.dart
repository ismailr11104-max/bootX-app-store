import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/wigets/custom_network_image.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_bloc.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductImageShowcase extends StatelessWidget {
  final List<String> images;

  const ProductImageShowcase({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProductDetailsBloc, ProductDetailsState, int>(
      selector: (state) =>
          state is ProductDetailsSuccess ? state.selectedImageIndex : 0,
      builder: (context, selectedIndex) {
        final safeIndex = selectedIndex < images.length ? selectedIndex : 0;
        return SizedBox(
          height: 235,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 24,
                child: Container(
                  width: 210,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.22),
                        blurRadius: 22,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: CustomNetworkImage(
                  imageUrl: images[safeIndex],
                  height: 195,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
