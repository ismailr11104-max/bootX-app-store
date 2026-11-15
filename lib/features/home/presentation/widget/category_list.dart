import 'package:bootx_app/core/wigets/category_item.dart';
import 'package:bootx_app/features/home/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  final List<CategoryEntity> categories;
  final String selectedCategoryId;
  final ValueChanged<String> onCategorySelected;

  const CategoriesListView({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final allCategory = CategoryEntity(
      id: 'all',
      name: 'all',
      image_url: 'https://cdn-icons-png.flaticon.com/512/5110/5110785.png',
    );

    final displayCategories = [allCategory, ...categories];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: displayCategories.length,
          separatorBuilder: (_, _) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final category = displayCategories[index];
            final isSelected =
                selectedCategoryId == category.id ||
                (selectedCategoryId.isEmpty && category.id == 'all');
            return CategoryItem(
              name: category.name,
              iconPath: category.image_url,
              isSelected: isSelected,
              onTap: () => onCategorySelected(category.id),
            );
          },
        ),
      ),
    );
  }
}
