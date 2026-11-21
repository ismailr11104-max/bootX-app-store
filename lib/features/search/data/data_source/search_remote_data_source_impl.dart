import 'package:bootx_app/core/model/product_model.dart';
import 'package:bootx_app/core/services/network/api_constance.dart';
import 'package:bootx_app/core/services/network/api_service.dart';
import 'package:bootx_app/features/search/data/data_source/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final response = await apiService.get(
      ApiConstance.search,
      queryParameters: {'q': query.trim()},
    );

    final productsList = response as List;

    return productsList
        .map(
          (item) =>
              ProductModel.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();
  }
}
