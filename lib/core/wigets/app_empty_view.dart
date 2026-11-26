import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppEmptyView extends StatelessWidget {
  const AppEmptyView({
    super.key,
    required this.title,
    required this.subtitle,
    this.image,
  });

  final String title;
  final String subtitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (image != null && image!.isNotEmpty)
            SvgPicture.asset(image!, width: 150, fit: BoxFit.contain),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.medium18.copyWith(
              color: AppColors.textLightPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.textLightSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
