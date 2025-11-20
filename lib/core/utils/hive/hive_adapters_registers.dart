import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/favorite/data/models/favorite_model.dart';
import '../../../features/search/data/models/search_history_model.dart';
import '../enums/content_type.dart';

void hiveAdapterRegisters() {
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(FavoriteModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(ContentTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(SearchHistoryModelAdapter());
  }
}
