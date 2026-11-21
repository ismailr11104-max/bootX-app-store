import 'package:bootx_app/core/error/failures.dart';
import 'package:bootx_app/features/search/domain/repo/search_history_repository.dart';
import 'package:dartz/dartz.dart';

class GetSearchHistoryUseCase {
  final SearchHistoryRepository repository;

  GetSearchHistoryUseCase(this.repository);

  Future<Either<Failure, List<String>>> call() async {
    return await repository.getSearchHistory();
  }
}

class SaveSearchQueryUseCase {
  final SearchHistoryRepository repository;

  SaveSearchQueryUseCase(this.repository);

  Future<Either<Failure, void>> call(String query) async {
    return await repository.saveSearchQuery(query);
  }
}

class DeleteSearchQueryUseCase {
  final SearchHistoryRepository repository;

  DeleteSearchQueryUseCase(this.repository);

  Future<Either<Failure, void>> call(String query) async {
    return await repository.deleteSearchQuery(query);
  }
}
