// lib/main.dart
import 'dart:developer';

import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/notification/notification_service.dart';
import 'package:cinemax_app_new/core/observer/bloc_observer.dart';
import 'package:cinemax_app_new/core/utils/hive/hive_adapters_registers.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/settings/presentation/cubits/settings_cubit.dart';
import 'package:cinemax_app_new/firebase_options.dart';
import 'package:cinemax_app_new/main_widgets/main_multi_bloc_providers.dart';
import 'package:cinemax_app_new/shared/presentation/utils/statues_bar.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // You can log or process data message
}

Future<void> bootApp(String envPath) async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  log('🚀 Starting app with env: $envPath...');

  try {
    await dotenv.load(fileName: envPath);
    log('✅ $envPath loaded');
  } catch (e) {
    log('⚠️ Failed to load $envPath: $e');
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await Hive.initFlutter();
  hiveAdapterRegisters();

  // 2) Basic system UI styling
  setStatuesBarColor();
  Bloc.observer = SimpleBlocObserver();

  await setupDependencies();

  final sessionCubit = getIt<SessionCubit>();
  await sessionCubit.checkAuthStatus();
  
  final settingsCubit = getIt<SettingsCubit>();
  await settingsCubit.checkSettings();

  FlutterNativeSplash.remove();

  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationService.instance.init();
  }

  @override
  Widget build(BuildContext context) => const MainMultiProvieders();
}
