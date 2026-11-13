import 'package:bootx_app/core/services/network/api_constance.dart';
import 'package:bootx_app/core/services/network/api_service.dart';
import 'package:bootx_app/features/auth/data/date_sourse/sign_in_remote_data_source.dart';
import 'package:bootx_app/features/auth/data/model/auth_response_model.dart';

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final ApiService _apiService;

  SignInRemoteDataSourceImpl(this._apiService);

  @override
  Future<AuthResponseModel> sigIn({
    required String email,
    required String password,
  }) async {
    final response = await _apiService.post(
      ApiConstance.authSignIn,
      body: {'email': email, 'password': password},
    );

    return AuthResponseModel.fromJson(response);
  }
}
