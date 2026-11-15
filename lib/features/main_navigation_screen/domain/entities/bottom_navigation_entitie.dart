import 'package:bootx_app/core/utils/app_image.dart';

class BottomNavigationEntities {
  final String active, nonActive;
  final String name;

  const BottomNavigationEntities({
    required this.active,
    required this.nonActive,
    required this.name,
  });
}

List<BottomNavigationEntities> bottomNavigationItem = [
  BottomNavigationEntities(
    active: AppImage.homeActive,
    nonActive: AppImage.homeNonActive,
    name: 'Home',
  ),
  BottomNavigationEntities(
    active: AppImage.cartActive,
    nonActive: AppImage.cartNonActive,
    name: 'Cart',
  ),
  BottomNavigationEntities(
    active: AppImage.favoriteActive,
    nonActive: AppImage.favoriteNonactive,
    name: 'Favorite',
  ),
  BottomNavigationEntities(
    active: AppImage.profileActive,
    nonActive: AppImage.profileNonactive,
    name: 'Profile',
  ),
];
