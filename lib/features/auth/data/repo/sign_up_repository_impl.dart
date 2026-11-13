import 'package:bootx_app/core/error/exceptions.dart';
import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/auth/data/date_sourse/sign_up_remote_data_source.dart';
import 'package:bootx_app/features/auth/domain/entity/user_entity.dart';
import 'package:bootx_app/features/auth/domain/repo/sign_up_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final authResponse = await remoteDataSource.sigUp(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );

      return Right(authResponse.user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
