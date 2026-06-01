import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:movify/core/network/client/network_info.dart';

/// Injectable Dio wrapper that holds the configured [Dio] instance,
/// pre-initialized [CacheOptions], and a [NetworkInfo] abstraction.
///
/// Replaces the old static [AppDio] singleton.
/// Register as a singleton in the service locator — all fields are
/// initialized before the first request is made.
class DioClient {
  final Dio dio;
  final CacheOptions cacheOptions;
  final NetworkInfo networkInfo;

  const DioClient({
    required this.dio,
    required this.cacheOptions,
    required this.networkInfo,
  });

  /// Build cache-aware [Options] for a single request.
  ///
  /// When the device is online the policy is [CachePolicy.request]
  /// (fetch fresh data and update cache). When offline the policy is
  /// [CachePolicy.forceCache] (serve from cache).
  ///
  /// Callers can override the policy (e.g. [CachePolicy.noCache] for
  /// search endpoints).
  Options cacheRequestOptions({CachePolicy? overridePolicy}) {
    final policy = overridePolicy ??
        (networkInfo.isConnected
            ? CachePolicy.request
            : CachePolicy.forceCache);

    return cacheOptions.copyWith(policy: policy).toOptions();
  }

  /// Clear all cached API responses.
  Future<void> clearCache() async {
    await cacheOptions.store?.clean();
  }
}
