import 'package:bootx_app/core/error/exceptions.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/cart/data/data_sources/cart_remote_datasource.dart';
import 'package:bootx_app/features/cart/domain/entities/cart_entity.dart';
import 'package:bootx_app/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      final cart = await remoteDataSource.getCart();
      return Right(cart);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> addToCart({
    required String productId,
    required int quantity,
    String size = '',
    String color = '',
  }) async {
    try {
      await remoteDataSource.addToCart({
        'productId': productId,
        'quantity': quantity,
        'size': size,
        'color': color,
      });

      return const Right(unit);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCartItem({
    required String productId,
    required int quantity,
    String size = '',
    String color = '',
  }) async {
    try {
      await remoteDataSource.updateCartItem(productId, {
        'quantity': quantity,
        'size': size,
        'color': color,
      });

      return const Right(unit);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeCartItem(String productId) async {
    try {
      await remoteDataSource.removeCartItem(productId);
      return const Right(unit);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearCart() async {
    try {
      await remoteDataSource.clearCart();
      return const Right(unit);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
