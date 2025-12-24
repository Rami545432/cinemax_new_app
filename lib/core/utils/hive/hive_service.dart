import 'dart:developer';

import 'package:cinemax_app_new/core/utils/hive/hive_box_names.dart';
import 'package:cinemax_app_new/features/favorite/data/models/favorite_model.dart';
import 'package:cinemax_app_new/features/search/data/models/search_history_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  // Cache opened boxes to avoid repeated lookups
  static Box<FavoriteModel>? _favoriteBox;
  static Box<SearchHistoryModel>? _searchHistoryBox;

  /// Get favorite box - opens on first access (lazy initialization)
  /// Uses openBox() for fast in-memory access
  static Future<Box<FavoriteModel>> getFavoriteBox() async {
    if (_favoriteBox != null && _favoriteBox!.isOpen) {
      return _favoriteBox!;
    }

    if (!Hive.isBoxOpen(HiveBoxNames.favoriteBox)) {
      log('📦 Opening favorite box (first access - lazy initialization)...');
      // Using openBox() not openLazyBox() - data loaded into memory for fast access
      _favoriteBox = await Hive.openBox<FavoriteModel>(
        HiveBoxNames.favoriteBox,
      );
    } else {
      _favoriteBox = Hive.box<FavoriteModel>(HiveBoxNames.favoriteBox);
    }

    return _favoriteBox!;
  }

  /// Get search history box - opens on first access (lazy initialization)
  /// Uses openBox() for fast in-memory access
  static Future<Box<SearchHistoryModel>> getSearchHistoryBox() async {
    if (_searchHistoryBox != null && _searchHistoryBox!.isOpen) {
      return _searchHistoryBox!;
    }

    if (!Hive.isBoxOpen(HiveBoxNames.searchHistoryBox)) {
      log(
        '📦 Opening search history box (first access - lazy initialization)...',
      );
      _searchHistoryBox = await Hive.openBox<SearchHistoryModel>(
        HiveBoxNames.searchHistoryBox,
      );
    } else {
      _searchHistoryBox = Hive.box<SearchHistoryModel>(
        HiveBoxNames.searchHistoryBox,
      );
    }

    return _searchHistoryBox!;
  }
}
