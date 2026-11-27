import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class DeleteItemCart extends StatelessWidget {
  final String size;
  final VoidCallback onDelete;

  const DeleteItemCart({super.key, required this.size, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            size,
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.textLightPrimary,
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: AppColors.textLightSecondary,
              size: 22,
            ),
            constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
