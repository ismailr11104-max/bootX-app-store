import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object?> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<ProductEntity> favourites;

  const FavouriteLoaded(this.favourites);

  @override
  List<Object?> get props => [favourites];
}

class FavouriteEmpty extends FavouriteState {}

class FavouriteError extends FavouriteState {
  final String message;

  const FavouriteError(this.message);

  @override
  List<Object?> get props => [message];
}
