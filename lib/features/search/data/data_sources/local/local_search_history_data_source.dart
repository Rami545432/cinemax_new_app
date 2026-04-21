import 'package:cinemax_app_new/features/search/data/models/search_history_model.dart';

abstract interface class LocalSearchHistoryDataSource {
  Future<void> addToSearchHistory(SearchHistoryModel searchHistory);
  Future<List<SearchHistoryModel>> getSearchHistory();
  Future<void> clearSearchHistory();
  Future<void> deleteFromSearchHistory(int id);
}
