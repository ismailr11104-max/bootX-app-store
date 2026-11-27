import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();

  Future<void> addToCart(Map<String, dynamic> body);

  Future<void> updateCartItem(String productId, Map<String, dynamic> body);

  Future<void> removeCartItem(String productId);

  Future<void> clearCart();
}
