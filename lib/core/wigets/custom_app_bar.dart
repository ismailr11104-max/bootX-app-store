import 'package:bootx_app/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? trailing;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    this.title,
    this.trailing,
    this.showBackButton = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFF8F9FA),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 64,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (showBackButton)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconButton(
                    onPressed: () => Navigator.maybePop(context),
                    icon: SvgPicture.asset(
                      AppImage.backButton,
                      width: 24,
                      height: 24,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(44, 44),
                    ),
                  ),
                ),
              if (title != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A2530),
                    ),
                  ),
                ),
              if (trailing != null)
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: trailing!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
