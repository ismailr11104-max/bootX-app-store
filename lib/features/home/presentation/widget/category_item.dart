import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/core/wigets/custom_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.name,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.all(isSelected ? 4.0 : 0.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: ClipOval(
                child: CustomNetworkImage(
                  imageUrl: iconPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Text(
                  name,
                  style: AppTextStyles.medium16.copyWith(
                    color: AppColors.textLightSecondary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
