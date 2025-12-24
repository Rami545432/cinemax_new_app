// lib/main.dart
import 'dart:developer';
import 'package:cinemax_app_new/core/utils/exports/main_exports.dart';
import 'package:cinemax_app_new/core/utils/helper/bloc_observer.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/firebase_options.dart';
import 'package:cinemax_app_new/main_widgets/main_multi_bloc_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  final startTime = DateTime.now();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  log('🚀 Starting app...');

  // 1) Environment variables (lightweight)
  try {
    await dotenv.load(fileName: ".env");
    log('✅ .env loaded');
  } catch (e) {
    log('⚠️ Failed to load .env: $e');
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  hiveAdapterRegisters();

  // 2) Basic system UI styling
  setStatuesBarColor();
  Bloc.observer = SimpleBlocObserver();

  await setupDependencies();

  final authCubit = getIt<AuthCubit>();
  await authCubit.checkAuthStatus();
  log('🔐 Local auth bootstrap state: ${authCubit.state.runtimeType}');

  FlutterNativeSplash.remove();

  runApp(const MyApp());

  final mainDuration = DateTime.now().difference(startTime).inMilliseconds;
  log('⏱️ main() completed in ${mainDuration}ms');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainMultiProvieders();
  }
}
