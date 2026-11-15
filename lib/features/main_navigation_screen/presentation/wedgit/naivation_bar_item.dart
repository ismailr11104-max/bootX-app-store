import 'package:bootx_app/features/main_navigation_screen/domain/entities/bottom_navigation_entitie.dart';
import 'package:bootx_app/features/main_navigation_screen/presentation/wedgit/active_item.dart';
import 'package:flutter/material.dart';

import 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });

  final bool isSelected;
  final BottomNavigationEntities bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.active,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(image: bottomNavigationBarEntity.nonActive);
  }
}
