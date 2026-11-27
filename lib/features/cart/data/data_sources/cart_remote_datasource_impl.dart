import 'package:bootx_app/core/services/network/api_constance.dart';
import 'package:bootx_app/core/services/network/api_service.dart';
import 'package:bootx_app/features/cart/data/data_sources/cart_remote_datasource.dart';
import 'package:bootx_app/features/cart/data/models/cart_model.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourceImpl(this.apiService);

  @override
  Future<CartModel> getCart() async {
    final response = await apiService.get<dynamic>(ApiConstance.cart);

    return CartModel.fromJson(Map<String, dynamic>.from(response as Map));
  }

  @override
  Future<void> addToCart(Map<String, dynamic> body) async {
    await apiService.post<dynamic>(ApiConstance.cart, body: body);
  }

  @override
  Future<void> updateCartItem(
    String productId,
    Map<String, dynamic> body,
  ) async {
    await apiService.put<dynamic>(
      ApiConstance.updateCartItem(productId),
      body: body,
    );
  }

  @override
  Future<void> removeCartItem(String productId) async {
    await apiService.delete<dynamic>(ApiConstance.removeCartItem(productId));
  }

  @override
  Future<void> clearCart() async {
    await apiService.delete<dynamic>(ApiConstance.cart);
  }
}
