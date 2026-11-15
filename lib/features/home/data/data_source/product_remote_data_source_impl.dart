import 'package:bootx_app/core/model/product_model.dart';
import 'package:bootx_app/core/services/network/api_constance.dart';
import 'package:bootx_app/core/services/network/api_service.dart';
import 'package:bootx_app/features/home/data/data_source/product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiService apiService;

  ProductRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductModel>> getProducts([String? categoryId]) async {
    final response = await apiService.get(ApiConstance.products);
    final List productsList = response['products'];

    final products = productsList
        .map(
          (item) =>
              ProductModel.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();
    if (categoryId == null || categoryId.isEmpty) {
      return products;
    }
    return products
        .where((product) => product.categoryId == categoryId)
        .toList();
  }
}
