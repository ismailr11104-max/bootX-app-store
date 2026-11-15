import 'package:bootx_app/core/services/network/api_constance.dart';
import 'package:bootx_app/core/services/network/api_service.dart';
import 'package:bootx_app/features/home/data/data_source/category_remote_data_source.dart';
import 'package:bootx_app/features/home/data/model/category_model.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiService apiService;

  CategoryRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiService.get<List<dynamic>>(
      ApiConstance.categories,
    );
    return response
        .map(
          (item) =>
              CategoryModel.fromMap(Map<String, dynamic>.from(item as Map)),
        )
        .toList();
  }
}
