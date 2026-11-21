import 'package:bootx_app/core/model/product_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<ProductModel>> searchProducts(String query);
}
