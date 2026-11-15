import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/home/domain/entity/category_entity.dart';
import 'package:bootx_app/features/home/domain/repo/category_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return repository.getCategories();
  }
}
