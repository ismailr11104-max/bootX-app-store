import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class FavouriteRepository {
  Future<Either<Failure, List<ProductEntity>>> getFavourites();

  Future<Either<Failure, void>> addFavourite(String productId);

  Future<Either<Failure, void>> removeFavourite(String productId);
}
