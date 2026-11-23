import 'package:bootx_app/core/model/product_model.dart';

abstract class FavouriteRemoteDataSource {
  Future<List<ProductModel>> getFavourites();
  Future<void> addFavourite(String productId);
  Future<void> removeFavourite(String productId);
}
