import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class GetFavouritesEvent extends FavouriteEvent {
  const GetFavouritesEvent();
}

class AddFavouriteEvent extends FavouriteEvent {
  final ProductEntity product;

  const AddFavouriteEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveFavouriteEvent extends FavouriteEvent {
  final String productId;

  const RemoveFavouriteEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class ToggleFavouriteEvent extends FavouriteEvent {
  final ProductEntity product;

  const ToggleFavouriteEvent(this.product);

  @override
  List<Object?> get props => [product];
}
