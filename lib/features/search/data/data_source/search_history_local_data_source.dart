abstract class SearchHistoryLocalDataSource {
  Future<List<String>> getSearchHistory();

  Future<void> saveSearchQuery(String query);

  Future<void> deleteSearchQuery(String query);
}
