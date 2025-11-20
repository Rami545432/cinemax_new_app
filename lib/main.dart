import 'dart:developer';
import 'package:cinemax_app_new/core/utils/exports/main_exports.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/features/splash/presentaion/views_models/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'main_widgets/main_multi_bloc_providers.dart';

void main() async {
  final startTime = DateTime.now();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  log('🚀 Starting app with optimized initialization...');

  // Load environment variables
  try {
    await dotenv.load(fileName: ".env");
    log('✅ Environment variables loaded successfully');
  } catch (e) {
    log('⚠️ Failed to load .env file: $e');
    log(
      '⚠️ App will continue but some features may not work without environment variables',
    );
  }

  // Only lightweight, synchronous operations in main()
  setStatuesBarColor();

  // Register ConnectivityCubit - lightweight
  getIt.registerLazySingleton<ConnectivityCubit>(() => ConnectivityCubit());

  // Initialize AppDio - now synchronous and lightweight
  AppDio.initialize(connectivityCubit: getIt.get<ConnectivityCubit>());

  // Initialize only essential services synchronously
  initialServiceLocatorSync();

  // Bloc.observer = SimpleBlocObserver();

  log('✅ Main initialization complete, launching app...');
  final mainDuration = DateTime.now().difference(startTime).inMilliseconds;
  log('🚀 Main initialization time: $mainDuration ms');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouters? appRouters;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  void _initializeApp() {
    _removeSplashImmediately();
    _startBackgroundInitialization();
  }

  void _removeSplashImmediately() {
    // Remove splash on next frame (after first build)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      log('🎨 Removing native splash');
      FlutterNativeSplash.remove();
    });
  }

  Future<void> _startBackgroundInitialization() async {
    final bgStartTime = DateTime.now();
    log('🔄 Starting background initialization...');

    try {
      // Run heavy initializations in parallel where possible
      await Future.wait([_initializeFirebase(), _initializeHive()]);

      // After Firebase and Hive are ready, initialize full service locator
      await initialServiceLocator();

      // Register AuthCubit after service locator is fully initialized
      _registerAuthCubit();

      // Initialize router with AuthCubit
      _initializeRouter();

      // Finally check auth status
      await _checkAuth();

      log('✅ Background initialization completed');
      final bgDuration = DateTime.now().difference(bgStartTime).inMilliseconds;
      log('🚀 Background initialization time: $bgDuration ms');
    } catch (e, stackTrace) {
      log('❌ Background initialization failed: $e');
      log('Stack trace: $stackTrace');
      // Still initialize router so app doesn't crash
      _initializeRouterFallback();
    }
  }

  void _registerAuthCubit() {
    // AuthCubit registration is moved from service locator to here
    // so we can control when it's created (after all dependencies are ready)
    if (!getIt.isRegistered<AuthCubit>()) {
      log('📝 Registering AuthCubit...');
      getIt.registerSingleton<AuthCubit>(
        AuthCubit(
          signInWithGoogleUseCase: getIt.get<SignInWithGoogleUseCase>(),
          signInWithFacebookUseCase: getIt.get<SignInWithFacebookUseCase>(),
          signInWithEmailUseCase: getIt.get<SignInWithEmailUseCase>(),
          signUpWithEmailUseCase: getIt.get<SignUpWithEmailUseCase>(),
          signOutUseCase: getIt.get<SignOutUseCase>(),
          continueAsGuestUseCase: getIt.get<ContinueAsGuestUseCase>(),
          getCurrentUserUseCase: getIt.get<GetCurrentUserUseCase>(),
          resetPasswordUseCase: getIt.get<ResetPasswordUseCase>(),
          enableGuestModeUseCase: getIt.get<EnableGuestModeUseCase>(),
          disableGuestModeUseCase: getIt.get<DisableGuestModeUseCase>(),
          isGuestModeUseCase: getIt.get<IsGuestModeUseCase>(),
        ),
      );
    }
  }

  Future<void> _initializeFirebase() async {
    log('🔥 Initializing Firebase...');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    log('✅ Firebase initialized');
  }

  Future<void> _initializeHive() async {
    log('📦 Initializing Hive...');
    await Hive.initFlutter();
    hiveAdapterRegisters();
    await hiveOpenBoxes();
    log('✅ Hive initialized');
  }

  void _initializeRouter() {
    log('📍 Initializing router...');
    final authCubit = getIt.get<AuthCubit>();
    setState(() {
      appRouters = AppRouters(authCubit: authCubit);
      _isInitialized = true;
    });
    log('✅ Router initialized');
  }

  void _initializeRouterFallback() {
    log('⚠️ Initializing router with fallback...');
    try {
      _initializeRouter();
    } catch (e) {
      log('❌ Router initialization failed: $e');
      // Mark as initialized anyway to prevent infinite loading
      setState(() {
        _isInitialized = true;
      });
    }
  }

  Future<void> _checkAuth() async {
    log('🔐 Checking auth status...');

    try {
      final authCubit = getIt.get<AuthCubit>();
      await authCubit.checkAuthStatus();
      log('✅ Auth check completed: ${authCubit.state.runtimeType}');
    } catch (e, stackTrace) {
      log('❌ Auth check failed: $e');
      log('Stack trace: $stackTrace');
      // Don't crash - router will redirect to login
    }
  }

  @override
  void dispose() {
    appRouters?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized && appRouters == null) {
      return MaterialApp(home: const SplashView());
    }
    return MainMultiProvieders(appRouters: appRouters!);
  }
}
