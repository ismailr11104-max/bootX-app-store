import 'package:bootx_app/features/auth/data/model/auth_response_model.dart';

abstract class SignInRemoteDataSource {
  Future<AuthResponseModel> sigIn({
    required String email,
    required String password,
  });
}
