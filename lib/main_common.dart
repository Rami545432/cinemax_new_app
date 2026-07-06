import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:movify/config/env/app_config.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/notification/notification_service.dart';
import 'package:movify/core/observer/bloc_observer.dart';
import 'package:movify/core/remote_config/remote_config_service.dart';
import 'package:movify/core/storage/hive/hive_adapters_registers.dart';
import 'package:movify/main_widgets/main_multi_bloc_providers.dart';
import 'package:movify/shared/presentation/utils/statues_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
}

Future<void> bootApp(AppConfig config) async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // ── Infrastructure ──────────────────────────────────────────────────────
  getIt.registerSingleton<AppConfig>(config);

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: config.firebaseOptions,
      name: config.environmentName,
    );
  }
  if (kDebugMode) {
    await ConsentInformation.instance.reset();
  }
  final patch = await ShorebirdUpdater().readCurrentPatch();
  FirebaseCrashlytics.instance.setCustomKey(
    'shorebird_patch_number',
    '${patch?.number}',
  );

  // Prevent Crashlytics from collecting crashes while debugging locally
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
    !kDebugMode,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await Hive.initFlutter();
  hiveAdapterRegisters();
  setStatuesBarColor();
  Bloc.observer = SimpleBlocObserver();

  // ── DI ──────────────────────────────────────────────────────────────────
  await setupDependencies();

  // ── Remote Config ────────────────────────────────────────────────────────
  await RemoteConfigService.instance.init();

  // ── Notifications ────────────────────────────────────────────────────────
  // Moved here from MyApp.initState — no reason to delay until widget mounts
  await NotificationService.instance.init();

  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MainMultiProvieders();
}
