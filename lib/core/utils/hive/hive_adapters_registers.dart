import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/data/models/favorite_model.dart';
import 'package:cinemax_app_new/features/search/data/models/search_history_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
