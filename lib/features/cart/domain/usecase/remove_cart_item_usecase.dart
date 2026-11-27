import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class RemoveCartItemUseCase {
  final CartRepository repository;

  RemoveCartItemUseCase(this.repository);

  Future<Either<Failure, void>> call(String productId) {
    return repository.removeCartItem(productId);
  }
}
