import 'package:dartz/dartz.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/features/search/domain/repo/search_repository.dart';

class SearchProductsUseCase {
  final SearchRepository repository;

  SearchProductsUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(String query) async {
    return await repository.searchProducts(query);
  }
}
