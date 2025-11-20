// import 'package:cinemax_app_new/core/network/data/data_sources/remote/connectivity_data_source.dart';
// import 'package:dio/dio.dart';
// import 'dart:developer';
// import 'dart:math' hide log;

// class RetryInterceptor extends Interceptor {
//   final int maxRetries;
//   final Duration baseDelay;
//   final List<DioExceptionType> retryableErrors;
//   final List<int> retryableStatusCodes;
//   final ConnectivityDataSourceImpl connectivityDataSource;
//   RetryInterceptor({
//     this.maxRetries = 3,
//     this.baseDelay = const Duration(milliseconds: 1000),
//     this.retryableErrors = const [
//       DioExceptionType.connectionTimeout,
//       DioExceptionType.receiveTimeout,
//       DioExceptionType.sendTimeout,
//       DioExceptionType.connectionError,
//     ],
//     this.retryableStatusCodes = const [
//       500, // Internal Server Error
//       502, // Bad Gateway
//       503, // Service Unavailable
//       504, // Gateway Timeout
//       429, // Too Many Requests (Rate Limited)
//     ],
//     required this.connectivityDataSource,
//   });

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     // 🚨 DON'T RETRY if this was marked as an offline request
//     if (err.requestOptions.extra['offline_request'] == true) {
//       log(
//         '🔄 Retry Chef: Skipping retry for offline request: ${err.requestOptions.path}',
//       );
//       handler.next(err);
//       return;
//     }

//     // Get current retry count from request options
//     final retryCount = err.requestOptions.extra['retry_count'] ?? 0;

//     // Check if we should retry this error
//     if (_shouldRetry(err) && retryCount < maxRetries) {
//       log(
//         '🔄 Retry Chef: Attempt ${retryCount + 1}/$maxRetries for ${err.requestOptions.path}',
//       );
//       if (!await connectivityDataSource.hasInternetAccess()) {
//         log('📡 Retry Chef: No connection, waiting...');
//         await connectivityDataSource.networkStatusStream.firstWhere(
//           (status) => status.hasInternetAccess,
//         );
//       }
//       // Increment retry count
//       err.requestOptions.extra['retry_count'] = retryCount + 1;

//       // Calculate delay with exponential backoff
//       final delay = _calculateDelay(retryCount);

//       log(
//         '🔄 Retry Chef: Attempt ${retryCount + 1}/$maxRetries for ${err.requestOptions.path} after ${delay.inMilliseconds}ms',
//       );

//       // Wait before retrying
//       await Future.delayed(delay);

//       try {
//         // Create a new Dio instance to avoid interceptor conflicts
//         final dio = Dio();

//         // Copy the original request options
//         final options = Options(
//           method: err.requestOptions.method,
//           headers: err.requestOptions.headers,
//           responseType: err.requestOptions.responseType,
//           contentType: err.requestOptions.contentType,
//           validateStatus: err.requestOptions.validateStatus,
//           receiveTimeout: err.requestOptions.receiveTimeout,
//           sendTimeout: err.requestOptions.sendTimeout,
//           extra: err.requestOptions.extra,
//         );

//         // Retry the request
//         final response = await dio.request(
//           err.requestOptions.path,
//           data: err.requestOptions.data,
//           queryParameters: err.requestOptions.queryParameters,
//           options: options,
//           cancelToken: err.requestOptions.cancelToken,
//         );

//         log(
//           '✅ Retry Chef: Success on attempt ${retryCount + 1} for ${err.requestOptions.path}',
//         );

//         // Resolve with the successful response
//         handler.resolve(response);
//         return;
//       } catch (retryError) {
//         log(
//           '❌ Retry Chef: Attempt ${retryCount + 1} failed for ${err.requestOptions.path}',
//         );

//         // If this was the last retry, continue with the original error
//         if (retryCount + 1 >= maxRetries) {
//           log(
//             '🚫 Retry Chef: All attempts exhausted for ${err.requestOptions.path}',
//           );
//           handler.next(err);
//           return;
//         }

//         // If not the last retry, this catch will be handled by the recursive call
//         if (retryError is DioException) {
//           onError(retryError, handler);
//           return;
//         }
//       }
//     }

//     // Don't retry, continue with normal error handling
//     handler.next(err);
//   }

//   /// Check if the error should be retried
//   bool _shouldRetry(DioException err) {
//     // Don't retry if request was cancelled
//     if (err.type == DioExceptionType.cancel) {
//       return false;
//     }

//     // Don't retry client errors (4xx) except rate limiting (429)
//     if (err.response?.statusCode != null) {
//       final statusCode = err.response!.statusCode!;

//       // Don't retry client errors (400-499) except 429
//       if (statusCode >= 400 && statusCode < 500 && statusCode != 429) {
//         return false;
//       }

//       // Only retry specific status codes
//       return retryableStatusCodes.contains(statusCode);
//     }

//     // Retry specific DioException types
//     return retryableErrors.contains(err.type);
//   }

//   /// Calculate delay with exponential backoff and jitter
//   Duration _calculateDelay(int retryCount) {
//     // Exponential backoff: baseDelay * 2^retryCount
//     final exponentialDelay = baseDelay.inMilliseconds * pow(2, retryCount);

//     // Add jitter (random factor) to prevent thundering herd
//     final jitter = Random().nextInt(1000); // 0-1000ms random

//     final totalDelay = exponentialDelay + jitter;

//     // Cap the delay at 30 seconds
//     return Duration(milliseconds: min(totalDelay.toInt(), 30000));
//   }
// }
