import 'package:hive_flutter/hive_flutter.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/data/models/favorite_model.dart';
import 'package:movify/features/search/data/models/search_history_model.dart';

void hiveAdapterRegisters() {
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(ContentTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(SearchHistoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(FavoriteModelAdapter());
  }
}
