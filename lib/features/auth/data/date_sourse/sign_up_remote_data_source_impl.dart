import 'package:bootx_app/core/services/network/api_constance.dart';
import 'package:bootx_app/core/services/network/api_service.dart';
import 'package:bootx_app/features/auth/data/date_sourse/sign_up_remote_data_source.dart';
import 'package:bootx_app/features/auth/data/model/auth_response_model.dart';

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final ApiService _apiService;
  SignUpRemoteDataSourceImpl(this._apiService);
  @override
  Future<AuthResponseModel> sigUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    final response = await _apiService.post(
      ApiConstance.authSignUp,
      body: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    return AuthResponseModel.fromJson(response);
  }
}
