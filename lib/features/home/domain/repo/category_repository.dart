import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/home/domain/entity/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
