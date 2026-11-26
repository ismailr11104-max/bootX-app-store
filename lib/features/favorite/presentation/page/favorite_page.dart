import 'package:bootx_app/core/utils/app_image.dart';
import 'package:bootx_app/core/wigets/custom_app_bar.dart';
import 'package:bootx_app/features/favorite/presentation/widgets/favourite_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritePage extends StatelessWidget {
  static const favoriteRouts = 'favorite_page';

  final VoidCallback onAddProducts;

  const FavoritePage({super.key, required this.onAddProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: CustomAppBar(
        title: 'Favourite',
        showBackButton: false,
        trailing: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(AppImage.notification, width: 24, height: 24),
        ),
      ),
      body: FavouriteBody(onAddProducts: onAddProducts),
    );
  }
}
