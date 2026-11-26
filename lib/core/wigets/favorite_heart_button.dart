import 'package:bootx_app/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteHeartButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onTap;

  const FavoriteHeartButton({super.key, required this.isFavorite, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color(0xFFF8F9FA),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          isFavorite ? AppImage.addFavorite : AppImage.nonAddFavorite,
          height: 18,
          width: 18,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
