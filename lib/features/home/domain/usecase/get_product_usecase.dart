import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/home/domain/repo/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetProductUseCase {
  final ProductRepository _repository;

  GetProductUseCase(this._repository);

  Future<Either<Failure, List<ProductEntity>>> call([String? categoryId]) {
    return _repository.getProduct(categoryId);
  }
}
