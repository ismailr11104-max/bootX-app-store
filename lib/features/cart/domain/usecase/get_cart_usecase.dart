import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/cart/domain/entities/cart_entity.dart';
import 'package:bootx_app/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<Either<Failure, CartEntity>> call() {
    return repository.getCart();
  }
}
