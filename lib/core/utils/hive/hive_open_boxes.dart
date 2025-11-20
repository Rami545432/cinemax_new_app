import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/favorite/data/models/favorite_model.dart';
import '../../../features/search/data/models/search_history_model.dart';
import 'hive_box_names.dart';

Future<void> hiveOpenBoxes() async {
  if (!Hive.isBoxOpen(HiveBoxNames.favoriteBox)) {
    await Hive.openBox<FavoriteModel>(HiveBoxNames.favoriteBox);
  }
  if (!Hive.isBoxOpen(HiveBoxNames.searchHistoryBox)) {
    await Hive.openBox<SearchHistoryModel>(HiveBoxNames.searchHistoryBox);
  }
}
