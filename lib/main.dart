import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/utils/enums/content_type.dart';
import 'core/utils/functions/statues_bar.dart';
import 'core/utils/get_it.dart';
import 'core/utils/helper/bloc_observer.dart';
import 'features/favorite/data/models/favorite_model.dart';
import 'features/search/data/models/search_history_model.dart';
import 'firebase_options.dart';
import 'main_widgets/main_multi_bloc_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();

  // Register the adapter
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(FavoriteModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(ContentTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(SearchHistoryModelAdapter());
  }

  // Open the box
  if (!Hive.isBoxOpen('favoritestsss')) {
    await Hive.openBox<FavoriteModel>('favoritestsss');
  }
  if (!Hive.isBoxOpen('searchHistoryBoxx')) {
    await Hive.openBox<SearchHistoryModel>('searchHistoryBoxx');
  }

  runApp(DevicePreview(builder: (context) => MyApp()));

  setStatuesBarColor();

  serviceLocator();

  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainMultiProvieders();
  }
}
