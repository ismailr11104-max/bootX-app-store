import 'package:bootx_app/core/model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts([String? categoryId]);
}
