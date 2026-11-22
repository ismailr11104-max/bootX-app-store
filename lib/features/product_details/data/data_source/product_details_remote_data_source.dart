import 'package:bootx_app/core/model/product_model.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductModel> getProductDetails(String productId);
}
