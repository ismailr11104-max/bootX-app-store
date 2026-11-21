import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/search/data/data_source/search_history_local_data_source.dart';
import 'package:bootx_app/features/search/domain/repo/search_history_repository.dart';
import 'package:dartz/dartz.dart';

class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final SearchHistoryLocalDataSource localDataSource;

  SearchHistoryRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<String>>> getSearchHistory() async {
    try {
      final history = await localDataSource.getSearchHistory();
      return Right(history);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveSearchQuery(String query) async {
    try {
      await localDataSource.saveSearchQuery(query);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSearchQuery(String query) async {
    try {
      await localDataSource.deleteSearchQuery(query);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
