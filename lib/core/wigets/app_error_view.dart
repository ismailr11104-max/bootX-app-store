import 'package:bootx_app/core/utils/app_colors.dart';
import 'package:bootx_app/core/utils/app_image.dart';
import 'package:bootx_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppEmptyView extends StatelessWidget {
  const AppEmptyView({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImage.errorView, width: 90),
          const SizedBox(height: 16),
          Text(
            'Something Went Wrong',
            style: AppTextStyles.medium18.copyWith(
              color: AppColors.textLightPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppTextStyles.medium14.copyWith(
              color: AppColors.textLightSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
