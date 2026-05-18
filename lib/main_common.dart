import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movify/config/env/app_config.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/notification/notification_service.dart';
import 'package:movify/core/observer/bloc_observer.dart';
import 'package:movify/core/storage/hive/hive_adapters_registers.dart';
import 'package:movify/main_widgets/main_multi_bloc_providers.dart';
import 'package:movify/shared/presentation/utils/statues_bar.dart';
import 'package:path_provider/path_provider.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
}

Future<void> bootApp(AppConfig config) async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  log('🚀 Starting app [${config.environmentName}]...');

  // ── Infrastructure ──────────────────────────────────────────────────────
  getIt.registerSingleton<AppConfig>(config);

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: config.firebaseOptions,
      name: config.environmentName,
    );
  }

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await Hive.initFlutter();
  hiveAdapterRegisters();
  setStatuesBarColor();
  Bloc.observer = SimpleBlocObserver();

  // ── DI ──────────────────────────────────────────────────────────────────
  await setupDependencies();

  // ── Notifications ────────────────────────────────────────────────────────
  // Moved here from MyApp.initState — no reason to delay until widget mounts
  await NotificationService.instance.init();

  FlutterNativeSplash.remove();
  runApp(
    kDebugMode
        ? DevicePreview(builder: (context) => const MyApp())
        : const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MainMultiProvieders();
}
