import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/error/exceptions.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/home/data/data_source/product_remote_data_source.dart';
import 'package:bootx_app/features/home/domain/repo/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct([
    String? categoryId,
  ]) async {
    try {
      final result = await dataSource.getProducts(categoryId);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
