import 'dart:convert';

import 'package:bootx_app/core/services/shared_preferences/shared_pref_manger.dart';
import 'package:bootx_app/features/search/data/data_source/search_history_local_data_source.dart';

class SearchHistoryLocalDataSourceImpl implements SearchHistoryLocalDataSource {
  static const String _searchHistoryKey = 'cached_search_history';
  static const int _maxHistoryLimit = 10;

  final PrefManger prefManger;

  SearchHistoryLocalDataSourceImpl({required this.prefManger});

  @override
  Future<List<String>> getSearchHistory() async {
    final jsonString = prefManger.getString(_searchHistoryKey);

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final List decoded = jsonDecode(jsonString);
      return decoded.map((e) => e.toString()).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> saveSearchQuery(String query) async {
    if (query.trim().isEmpty) return;

    final trimmedQuery = query.trim();
    final currentHistory = await getSearchHistory();

    currentHistory.removeWhere(
      (item) => item.toLowerCase() == trimmedQuery.toLowerCase(),
    );

    currentHistory.insert(0, trimmedQuery);

    if (currentHistory.length > _maxHistoryLimit) {
      currentHistory.removeRange(_maxHistoryLimit, currentHistory.length);
    }

    await prefManger.setString(_searchHistoryKey, jsonEncode(currentHistory));
  }

  @override
  Future<void> deleteSearchQuery(String query) async {
    final currentHistory = await getSearchHistory();

    currentHistory.removeWhere(
      (item) => item.toLowerCase() == query.trim().toLowerCase(),
    );

    await prefManger.setString(_searchHistoryKey, jsonEncode(currentHistory));
  }
}
