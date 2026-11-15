import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/home/data/data_source/category_remote_data_source.dart';
import 'package:bootx_app/features/home/domain/entity/category_entity.dart';
import 'package:bootx_app/features/home/domain/repo/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(List<CategoryEntity>.from(categories));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
