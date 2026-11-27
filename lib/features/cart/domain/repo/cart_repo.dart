import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/cart/domain/entities/cart_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>> getCart();

  Future<Either<Failure, Unit>> addToCart({
    required String productId,
    required int quantity,
    String size = '',
    String color = '',
  });

  Future<Either<Failure, Unit>> updateCartItem({
    required String productId,
    required int quantity,
    String size = '',
    String color = '',
  });

  Future<Either<Failure, Unit>> removeCartItem(String productId);

  Future<Either<Failure, Unit>> clearCart();
}
