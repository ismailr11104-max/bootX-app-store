import 'package:bootx_app/core/model/product_model.dart';
import 'package:bootx_app/core/services/network/api_constance.dart';
import 'package:bootx_app/core/services/network/api_service.dart';
import 'package:bootx_app/features/product_details/data/data_source/product_details_remote_data_source.dart';

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final ApiService apiService;

  const ProductDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<ProductModel> getProductDetails(String productId) async {
    final endpoint = ApiConstance.productDetails.replaceFirst(
      '{id}',
      productId,
    );
    final data = await apiService.get(endpoint);
    return ProductModel.fromJson(data);
  }
}
