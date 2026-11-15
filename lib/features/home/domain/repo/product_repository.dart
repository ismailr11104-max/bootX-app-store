import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProduct([String? categoryId]);
}
