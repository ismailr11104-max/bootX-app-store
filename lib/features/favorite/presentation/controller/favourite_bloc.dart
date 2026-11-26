import 'package:bootx_app/core/entity/product_entity.dart';
import 'package:bootx_app/features/favorite/domain/usecase/add_favourite_usecase.dart';
import 'package:bootx_app/features/favorite/domain/usecase/get_favourites_usecase.dart';
import 'package:bootx_app/features/favorite/domain/usecase/remove_favourite_usecase.dart';
import 'package:bootx_app/features/favorite/presentation/controller/favourite_event.dart';
import 'package:bootx_app/features/favorite/presentation/controller/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final GetFavouritesUseCase getFavouritesUseCase;
  final AddFavouriteUseCase addFavouriteUseCase;
  final RemoveFavouriteUseCase removeFavouriteUseCase;

  List<ProductEntity> _items = [];

  FavouriteBloc({
    required this.getFavouritesUseCase,
    required this.addFavouriteUseCase,
    required this.removeFavouriteUseCase,
  }) : super(FavouriteInitial()) {
    on<GetFavouritesEvent>(_onGetFavourites);
    on<AddFavouriteEvent>(_onAddFavourite);
    on<RemoveFavouriteEvent>(_onRemoveFavourite);
    on<ToggleFavouriteEvent>(_onToggleFavourite);
  }

  Future<void> _onGetFavourites(
    GetFavouritesEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    if (state is FavouriteInitial) emit(FavouriteLoading());

    final result = await getFavouritesUseCase();
    result.fold((failure) => emit(FavouriteError(failure.message)), (products) {
      _items = products;
      emit(_items.isEmpty ? FavouriteEmpty() : FavouriteLoaded(_items));
    });
  }

  Future<void> _onAddFavourite(
    AddFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    final result = await addFavouriteUseCase(event.product.id);
    result.fold(
      (failure) => emit(FavouriteError(failure.message)),
      (_) => add(const GetFavouritesEvent()),
    );
  }

  Future<void> _onRemoveFavourite(
    RemoveFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    final result = await removeFavouriteUseCase(event.productId);
    result.fold(
      (failure) => emit(FavouriteError(failure.message)),
      (_) => add(const GetFavouritesEvent()),
    );
  }

  void _onToggleFavourite(
    ToggleFavouriteEvent event,
    Emitter<FavouriteState> emit,
  ) {
    if (isFavourite(event.product.id)) {
      add(RemoveFavouriteEvent(event.product.id));
    } else {
      add(AddFavouriteEvent(event.product));
    }
  }

  bool isFavourite(String productId) =>
      _items.any((item) => item.id == productId);
}
