import 'package:bootx_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchHistoryRepository {
  Future<Either<Failure, List<String>>> getSearchHistory();

  Future<Either<Failure, void>> saveSearchQuery(String query);

  Future<Either<Failure, void>> deleteSearchQuery(String query);
}
