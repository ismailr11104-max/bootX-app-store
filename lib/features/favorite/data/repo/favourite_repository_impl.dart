import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/error/exceptions.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/favorite/data/data_source/favourite_remote_data_source.dart';
import 'package:bootx_app/features/favorite/domain/repo/favourite_repository.dart';
import 'package:dartz/dartz.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
  final FavouriteRemoteDataSource remoteDataSource;

  FavouriteRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavourites() async {
    try {
      final result = await remoteDataSource.getFavourites();
      return Right(result);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavourite(String productId) async {
    try {
      await remoteDataSource.addFavourite(productId);
      return const Right(null);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavourite(String productId) async {
    try {
      await remoteDataSource.removeFavourite(productId);
      return const Right(null);
    } on AppException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
