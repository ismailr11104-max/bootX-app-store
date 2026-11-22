import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/error/exceptions.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/product_details/data/data_source/product_details_remote_data_source.dart';
import 'package:bootx_app/features/product_details/domain/repo/product_details_repositor.dart';
import 'package:dartz/dartz.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource remoteDataSource;

  const ProductDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ProductEntity>> getProductDetails(
    String productId,
  ) async {
    try {
      final product = await remoteDataSource.getProductDetails(productId);
      return Right(product);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
