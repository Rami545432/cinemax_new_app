import 'package:cinemax_app_new/features/search/domain/entities/search_history_entity.dart';

abstract interface class SearchHistoryRepo {
  Future<void> clearSearchHistory();
  Future<void> addToSearchHistory(SearchHistoryEntity searchHistory);
  Future<List<SearchHistoryEntity>> getSearchHistory();
  Future<void> deleteFromSearchHistory(int id);
}
