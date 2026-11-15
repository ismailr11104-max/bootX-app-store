import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  static const favoriteRouts = 'favorite_page';
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favorite Page', style: TextStyle(fontSize: 20)));
  }
}
