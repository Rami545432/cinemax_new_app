import 'package:cinemax_app_new/core/utils/hive/hive_box_names.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/search_history_model.dart';

abstract class LocalSearchDataSource {
  Future<void> addToSearchHistory(SearchHistoryModel searchHistory);
  Future<List<SearchHistoryModel>> getSearchHistory();
  Future<void> clearSearchHistory();
  Future<void> deleteSearchHistory(int id);
}

class LocalSearchDataSourceImpl implements LocalSearchDataSource {
  static const _boxName = HiveBoxNames.searchHistoryBox;
  @override
  Future<void> addToSearchHistory(SearchHistoryModel searchHistory) async {
    final box = await Hive.openBox<SearchHistoryModel>(_boxName);
    if (box.values.any((element) => element.query == searchHistory.query)) {
      return;
    }
    await box.add(searchHistory);
  }

  @override
  Future<List<SearchHistoryModel>> getSearchHistory() async {
    final box = await Hive.openBox<SearchHistoryModel>(_boxName);
    return box.values.toList().reversed.toList();
  }

  @override
  Future<void> clearSearchHistory() async {
    final box = await Hive.openBox<SearchHistoryModel>(_boxName);
    await box.clear();
  }

  @override
  Future<void> deleteSearchHistory(int id) async {
    final box = await Hive.openBox<SearchHistoryModel>(_boxName);
    final key = box.keys.firstWhere((key) => box.get(key)?.id == id);
    await box.delete(key);
  }
}
