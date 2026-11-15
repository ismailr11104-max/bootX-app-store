import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const cartRouts = 'cart_page';
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Cart Page', style: TextStyle(fontSize: 20)));
  }
}
