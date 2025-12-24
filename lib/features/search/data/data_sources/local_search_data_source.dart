import 'package:cinemax_app_new/core/utils/hive/hive_service.dart';

import '../models/search_history_model.dart';

abstract class LocalSearchDataSource {
  Future<void> addToSearchHistory(SearchHistoryModel searchHistory);
  Future<List<SearchHistoryModel>> getSearchHistory();
  Future<void> clearSearchHistory();
  Future<void> deleteSearchHistory(int id);
}

class LocalSearchDataSourceImpl implements LocalSearchDataSource {
  // static const _boxName = HiveBoxNames.searchHistoryBox;
  @override
  Future<void> addToSearchHistory(SearchHistoryModel searchHistory) async {
    final box = await HiveService.getSearchHistoryBox();
    if (box.values.any((element) => element.query == searchHistory.query)) {
      return;
    }
    await box.add(searchHistory);
  }

  @override
  Future<List<SearchHistoryModel>> getSearchHistory() async {
    final box = await HiveService.getSearchHistoryBox();
    return box.values.toList().reversed.toList();
  }

  @override
  Future<void> clearSearchHistory() async {
    final box = await HiveService.getSearchHistoryBox();
    await box.clear();
  }

  @override
  Future<void> deleteSearchHistory(int id) async {
    final box = await HiveService.getSearchHistoryBox();
    final key = box.keys.firstWhere((key) => box.get(key)?.id == id);
    await box.delete(key);
  }
}
