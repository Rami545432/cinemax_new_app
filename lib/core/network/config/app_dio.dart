import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:path_provider/path_provider.dart';

import '../Interceptors/cancellation_interceptor.dart';
import '../Interceptors/error_interceptor.dart';
import '../Interceptors/logging_interceptor.dart';
import '../Interceptors/security_interceptor.dart';

import '../presentation/cubit/connectivity_cubit.dart';
import 'dio_config.dart';

class AppDio {
  static Dio? _instance;
  static ConnectivityCubit? _connectivityCubit;
  static CacheOptions? _cacheOptions;
  static bool _cacheInitialized = false;

  /// Lightweight initialization - only register connectivity cubit
  static void initialize({required ConnectivityCubit connectivityCubit}) {
    log('🚀 Initializing AppDio (lightweight)');
    _connectivityCubit = connectivityCubit;
    log('✅ AppDio initialized (cache will be lazy-loaded)');
  }

  /// Initialize cache (called lazily on first network request)
  static Future<void> _initializeCache() async {
    if (_cacheInitialized) return;

    log('🔄 Lazy initializing cache...');
    final cacheDir = await getTemporaryDirectory();
    final cacheStore = HiveCacheStore(cacheDir.path, hiveBoxName: 'api_cache');

    _cacheOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.forceCache,
      maxStale: Duration(days: 7),
      hitCacheOnErrorCodes: [500],
      hitCacheOnNetworkFailure: true,
      priority: CachePriority.high,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    _cacheInitialized = true;
    log('✅ Cache initialized with directory: ${cacheDir.path}');
  }

  static Dio get instance {
    _instance ??= _createDio();
    return _instance!;
  }

  static Future<CacheOptions> get cacheOptions async {
    if (!_cacheInitialized) {
      await _initializeCache();
    }
    return _cacheOptions!;
  }

  static Dio _createDio() {
    final dio = Dio();

    // Configure base options
    dio.options = DioConfig.baseOptions;

    // Create interceptors without cache initially (cache added lazily)
    final interceptors = <Interceptor>[
      SecurityInterceptor(),
      CancellationInterceptor(),
      LoggingInterceptor(),
      RetryInterceptor(
        dio: dio,
        logPrint: print, // specify log function (optional)
        retries: 3, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
      ErrorInterceptor(),
    ];

    dio.interceptors.addAll(interceptors);

    // Add cache interceptor lazily
    _ensureCacheInterceptor(dio);

    log(
      '📡 Dio instance created with ${interceptors.length} base interceptors',
    );
    return dio;
  }

  static void _ensureCacheInterceptor(Dio dio) {
    // Add cache interceptor asynchronously when cache is ready
    _initializeCache()
        .then((_) {
          if (!dio.interceptors.any((i) => i is DioCacheInterceptor)) {
            dio.interceptors.insert(
              0,
              DioCacheInterceptor(options: _cacheOptions!),
            );
            log('✅ Cache interceptor added to Dio');
          }
        })
        .catchError((e) {
          log('⚠️ Failed to initialize cache: $e (continuing without cache)');
        });
  }

  static Future<void> resetInstance() async {
    _instance?.close(force: true);
    _instance = null;
    _connectivityCubit = null;

    log('♻️ AppDio instance reset');
  }

  static Future<void> clearCache() async {
    if (_cacheOptions != null) {
      await _cacheOptions!.store!.clean();
      log('🗑️ API cache cleared');
    }
  }

  static bool get hasConnectivity => _connectivityCubit?.isOnline ?? false;
}
