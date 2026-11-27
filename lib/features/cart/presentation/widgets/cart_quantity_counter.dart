import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CartQuantityCounter extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartQuantityCounter({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _counterButton(
          icon: Icons.remove,
          bgColor: Colors.white,
          iconColor: AppColors.textLightPrimary,
          onTap: quantity > 1 ? onDecrement : null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            '$quantity',
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.textLightPrimary,
            ),
          ),
        ),
        _counterButton(
          icon: Icons.add,
          bgColor: AppColors.primary,
          iconColor: Colors.white,
          onTap: onIncrement,
        ),
      ],
    );
  }

  Widget _counterButton({
    required IconData icon,
    required Color bgColor,
    required Color iconColor,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Icon(icon, size: 16, color: iconColor),
      ),
    );
  }
}
