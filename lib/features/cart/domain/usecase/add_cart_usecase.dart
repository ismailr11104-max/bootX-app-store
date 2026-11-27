import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String productId,
    required int quantity,
    String size = '',
    String color = '',
  }) {
    return repository.addToCart(
      productId: productId,
      quantity: quantity,
      size: size,
      color: color,
    );
  }
}
