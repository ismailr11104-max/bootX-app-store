import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateCartItemUseCase {
  final CartRepository repository;

  UpdateCartItemUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required String productId,
    required int quantity,
    String size = '',
    String color = '',
  }) {
    return repository.updateCartItem(
      productId: productId,
      quantity: quantity,
      size: size,
      color: color,
    );
  }
}
