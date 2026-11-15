import 'package:bootx_app/features/cart/presentation/page/cart_page.dart';
import 'package:bootx_app/features/favorite/presentation/page/favorite_page.dart';
import 'package:bootx_app/features/home/presentation/page/home_page.dart';
import 'package:bootx_app/features/profile/presentation/page/profile_page.dart';
import 'package:flutter/material.dart';

import 'wedgit/custom_bottom_navigation.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  static const routeBottomNavigation = 'bottom_navigation';

  @override
  State<MainNavigationView> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationView> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    CartPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[currentIndex]),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: currentIndex,
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
