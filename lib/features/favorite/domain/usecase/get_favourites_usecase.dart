import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/favorite/domain/repo/favourite_repository.dart';
import 'package:dartz/dartz.dart';

class GetFavouritesUseCase {
  final FavouriteRepository repository;

  GetFavouritesUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call() {
    return repository.getFavourites();
  }
}
