import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/core/wigets/custom_network_image.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_bloc.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_event.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGallerySection extends StatelessWidget {
  final List<String> images;

  const ProductGallerySection({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gallery',
          style: AppTextStyles.medium18.copyWith(
            color: AppColors.textLightPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 58,
          child: BlocSelector<ProductDetailsBloc, ProductDetailsState, int>(
            selector: (state) =>
                state is ProductDetailsSuccess ? state.selectedImageIndex : 0,
            builder: (context, selectedIndex) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () => context.read<ProductDetailsBloc>().add(
                      SelectImageEvent(index),
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 58,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: CustomNetworkImage(
                        imageUrl: images[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
