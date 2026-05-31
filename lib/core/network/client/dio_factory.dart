import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:movify/core/network/client/dio_client.dart';
import 'package:movify/core/network/client/network_info.dart';
import 'package:movify/core/network/config/dio_config.dart';
import 'package:movify/core/network/interceptors/api_key_interceptor.dart';
import 'package:movify/core/network/interceptors/logging_interceptor.dart';
import 'package:path_provider/path_provider.dart';

/// Factory that builds a fully configured [DioClient].
///
/// Call [create] once during app startup (in the service locator).
/// Cache is initialized synchronously (awaited) before Dio is
/// returned — no more fire-and-forget race conditions.
class DioFactory {
  const DioFactory._();

  /// Creates a [DioClient] with all interceptors attached and cache
  /// initialized.
  ///
  /// This is an `async` factory because cache setup requires I/O
  /// (getting the temp directory). The result should be registered
  /// as a singleton so it's only called once.
  static Future<DioClient> create({
    required String tmdbApiKey,
    required NetworkInfo networkInfo,
    required FirebaseAuth firebaseAuth,
  }) async {
    // ── 1. Cache store ──────────────────────────────────────────────
    final cacheDir = await getTemporaryDirectory();
    final cacheStore = HiveCacheStore(cacheDir.path, hiveBoxName: 'api_cache');
    final cacheOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 7),
      hitCacheOnErrorCodes: [500],
      hitCacheOnNetworkFailure: true,
      priority: CachePriority.high,
    );
    log('✅ Cache initialized: ${cacheDir.path}');

    // ── 2. Dio instance ─────────────────────────────────────────────
    final dio = Dio(DioConfig.baseOptions);

    // ── 3. Interceptors (order matters) ─────────────────────────────
    // Cache interceptor first — so it can short-circuit on cache hits.
    dio.interceptors.addAll([
      DioCacheInterceptor(options: cacheOptions),
      ApiKeyInterceptor(tmdbApiKey: tmdbApiKey),
      LoggingInterceptor(),
      RetryInterceptor(dio: dio, retryDelays: DioConfig.retryDelays),
    ]);

    log('📡 Dio created with ${dio.interceptors.length} interceptors');

    return DioClient(
      dio: dio,
      cacheOptions: cacheOptions,
      networkInfo: networkInfo,
    );
  }
}
