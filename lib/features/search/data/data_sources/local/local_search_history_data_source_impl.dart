import 'package:injectable/injectable.dart';
import 'package:movify/core/storage/hive/hive_service.dart';
import 'package:movify/features/search/data/data_sources/local/local_search_history_data_source.dart';
import 'package:movify/features/search/data/models/search_history_model.dart';

@LazySingleton(as: LocalSearchHistoryDataSource)
class LocalSearchDataSourceImpl implements LocalSearchHistoryDataSource {
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
  Future<void> deleteFromSearchHistory(int id) async {
    final box = await HiveService.getSearchHistoryBox();
    final key = box.keys.firstWhere((key) => box.get(key)?.id == id);
    await box.delete(key);
  }
}
