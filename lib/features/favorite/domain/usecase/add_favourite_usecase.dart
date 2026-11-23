import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/favorite/domain/repo/favourite_repository.dart';
import 'package:dartz/dartz.dart';

class AddFavouriteUseCase {
  final FavouriteRepository repository;
  AddFavouriteUseCase(this.repository);
  Future<Either<Failure, void>> call(String productId) {
    return repository.addFavourite(productId);
  }
}
