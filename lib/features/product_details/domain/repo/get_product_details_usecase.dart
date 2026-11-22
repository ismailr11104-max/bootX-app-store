import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/product_details/domain/repo/product_details_repositor.dart';
import 'package:dartz/dartz.dart';

class GetProductDetailsUseCase {
  final ProductDetailsRepository repository;

  const GetProductDetailsUseCase(this.repository);

  Future<Either<Failure, ProductEntity>> call(String productId) {
    return repository.getProductDetails(productId);
  }
}
