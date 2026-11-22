import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_bloc.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_event.dart';
import 'package:bootx_app/features/product_details/presentation/controller/product_detlais_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizeSection extends StatelessWidget {
  final List<String> sizes;

  const ProductSizeSection({super.key, required this.sizes});

  @override
  Widget build(BuildContext context) {
    if (sizes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: AppTextStyles.medium18.copyWith(
            color: AppColors.textLightPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        BlocSelector<ProductDetailsBloc, ProductDetailsState, int>(
          selector: (state) =>
              state is ProductDetailsSuccess ? state.selectedSizeIndex : 0,
          builder: (context, selectedIndex) {
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(sizes.length, (index) {
                final isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () => context.read<ProductDetailsBloc>().add(
                    SelectSizeEvent(index),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.background,
                      shape: BoxShape.circle,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(
                                  alpha: 0.35,
                                ),
                                blurRadius: 12,
                                offset: const Offset(0, 5),
                              ),
                            ]
                          : null,
                    ),
                    child: Text(
                      sizes[index],
                      style: AppTextStyles.medium16.copyWith(
                        color: isSelected
                            ? Colors.white
                            : AppColors.textLightSecondary,
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
