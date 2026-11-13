import 'package:bootx_app/features/auth/data/model/auth_response_model.dart';

abstract class SignUpRemoteDataSource {
  Future<AuthResponseModel> sigUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
}
