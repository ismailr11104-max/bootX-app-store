import 'package:bootx_app/core/model/product_model.dart';
import 'package:bootx_app/core/services/network/api_constance.dart';
import 'package:bootx_app/core/services/network/api_service.dart';
import 'package:bootx_app/features/favorite/data/data_source/favourite_remote_data_source.dart';

class FavouriteRemoteDataSourceImpl implements FavouriteRemoteDataSource {
  final ApiService apiService;

  FavouriteRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductModel>> getFavourites() async {
    final response = await apiService.get<List<dynamic>>(
      ApiConstance.favorites,
    );
    return response.map((item) => ProductModel.fromJson(item)).toList();
  }

  @override
  Future<void> addFavourite(String productId) async {
    await apiService.post<dynamic>(
      ApiConstance.favorites,
      body: {'productId': productId},
    );
  }

  @override
  Future<void> removeFavourite(String productId) async {
    final endpoint = ApiConstance.removeFavorite.replaceFirst(
      '{productId}',
      productId,
    );

    await apiService.delete<dynamic>(endpoint);
  }
}
