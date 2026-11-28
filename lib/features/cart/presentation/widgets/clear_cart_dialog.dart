import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_image.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:bootx_app/core/wigets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClearCartDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ClearCartDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    const redColor = Color(0xFFFF3B30);

    return Dialog(
      backgroundColor: const Color(0xFFF2F2F7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Clear Cart',
              style: AppTextStyles.medium18.copyWith(
                color: AppColors.textLightPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            SvgPicture.asset(
              AppImage.trashCart,
              width: 48,
              height: 48,
              colorFilter: const ColorFilter.mode(redColor, BlendMode.srcIn),
            ),
            const SizedBox(height: 16),

            Text(
              'Are you sure you want to remove all items from your cart?',
              textAlign: TextAlign.center,
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.textLightSecondary,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Cancel',
                    height: 48,
                    backgroundColor: const Color(0xFFD1D1D6),
                    textColor: AppColors.textLightPrimary,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: 'Delete',
                    height: 48,
                    backgroundColor: redColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
