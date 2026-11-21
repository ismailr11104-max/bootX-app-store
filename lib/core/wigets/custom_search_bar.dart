import 'package:bootx_app/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final bool readOnly;
  final Widget? suffixIcon;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.onTap,
    this.onSubmitted,
    this.readOnly = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppImage.searchIcon, width: 24, height: 24),
          ),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
