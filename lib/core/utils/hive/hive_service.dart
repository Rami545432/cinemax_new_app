import 'package:cinemax_app_new/core/utils/hive/hive_box_names.dart';
import 'package:cinemax_app_new/features/favorite/data/models/favorite_model.dart';
import 'package:cinemax_app_new/features/search/data/models/search_history_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  static Box<SearchHistoryModel>? _searchHistoryBox;
  static Box<FavoriteModel>? _newFavoriteBox;
  static Box<dynamic>? _metaDataBox;
  static Future<Box<SearchHistoryModel>> getSearchHistoryBox() async {
    if (_searchHistoryBox != null && _searchHistoryBox!.isOpen) {
      return _searchHistoryBox!;
    }

    if (!Hive.isBoxOpen(HiveBoxNames.searchHistoryBox)) {
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

  static Future<Box<FavoriteModel>> getNewFavoriteBox() async {
    if (_newFavoriteBox != null && _newFavoriteBox!.isOpen) {
      return _newFavoriteBox!;
    }

    if (!Hive.isBoxOpen(HiveBoxNames.newFavoriteBox)) {
      _newFavoriteBox = await Hive.openBox<FavoriteModel>(
        HiveBoxNames.newFavoriteBox,
      );
    } else {
      _newFavoriteBox = Hive.box<FavoriteModel>(HiveBoxNames.newFavoriteBox);
    }

    return _newFavoriteBox!;
  }

  static Future<Box<dynamic>> getMetaDataBox() async {
    if (_metaDataBox != null && _metaDataBox!.isOpen) {
      return _metaDataBox!;
    }

    if (!Hive.isBoxOpen(HiveBoxNames.metaBox)) {
      _metaDataBox = await Hive.openBox<dynamic>(HiveBoxNames.metaBox);
    } else {
      _metaDataBox = Hive.box<dynamic>(HiveBoxNames.metaBox);
    }

    return _metaDataBox!;
  }
}
