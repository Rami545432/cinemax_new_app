// import 'package:dio/dio.dart';
// import 'dart:developer';
// import '../presentation/cubit/manger/connectivity_cubit/connectivity_cubit.dart';
// import '../presentation/cubit/manger/request_queue_cubit/request_cubit.dart';

// // ... existing imports ...

// class NetworkMonitorInterceptor extends Interceptor {
//   final ConnectivityCubit connectivityCubit;
//   final RequestQueueCubit queueCubit;

//   NetworkMonitorInterceptor({
//     required this.connectivityCubit,
//     required this.queueCubit,
//   });

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // Add network info to request headers
//     final networkStatus = connectivityCubit.stream;
//     if (networkStatus != null) {
//       options.headers['X-Network-Status'] = networkStatus.status.name;
//       options.headers['X-Network-Type'] = networkStatus.types.name;
//     }

//     options.headers['X-Queue-Size'] = queueCubit.queueCount.toString();
//     options.headers['X-Is-Online'] = connectivityCubit.isOnline.toString();

//     if (connectivityCubit.isOffline) {
//       log('📡 Device is offline: ${options.path} - marking as offline request');
//       options.extra['offline_request'] = true;
//     }

//     handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     // 🚀 CRITICAL FIX: Handle cache miss scenarios gracefully
//     if (err.requestOptions.extra['cache_miss_offline'] == true ||
//         err.requestOptions.extra['offline_cache_miss'] == true) {
//       log(
//         '📡 ⚠️ Cache miss while offline: ${err.requestOptions.path} - queuing for later',
//       );

//       // Queue request for when we're back online
//       queueCubit.queueRequest(err.requestOptions);

//       // 🚀 IMPROVED: Provide a specific error type for offline cache misses
//       final friendlyError = DioException(
//         requestOptions: err.requestOptions,
//         type: DioExceptionType.connectionError,
//         message: 'Content not available offline. Will load when connected.',
//         response: Response(
//           requestOptions: err.requestOptions,
//           statusCode: 0,
//           headers: Headers.fromMap({
//             'x-offline-error': ['true'],
//             'x-cache-miss': ['true'],
//           }),
//         ),
//       );

//       handler.next(friendlyError);
//       return;
//     }

//     // Handle other network errors...
//     if ((err.type == DioExceptionType.connectionError ||
//             err.type == DioExceptionType.connectionTimeout ||
//             err.type == DioExceptionType.receiveTimeout) &&
//         connectivityCubit.isOffline) {
//       log('📡 Network error while offline: ${err.type}');
//       queueCubit.queueRequest(err.requestOptions);

//       final modifiedError = DioException(
//         requestOptions: err.requestOptions,
//         type: err.type,
//         message: 'No internet connection. Will retry when connected.',
//         response: err.response,
//       );

//       handler.next(modifiedError);
//       return;
//     }

//     if (err.type == DioExceptionType.connectionError ||
//         err.type == DioExceptionType.connectionTimeout ||
//         err.type == DioExceptionType.receiveTimeout) {
//       log('📡 Network error detected: ${err.type}');
//       queueCubit.queueRequest(err.requestOptions);
//     }

//     handler.next(err);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     if (connectivityCubit.isOnline) {
//       log(
//         '📡 Request completed successfully while online: ${response.statusCode}',
//       );
//     }

//     if (response.headers['x-cached']?.isNotEmpty == true) {
//       final cacheType = response.headers['x-offline-cache']?.isNotEmpty == true
//           ? 'offline cache'
//           : response.headers['x-stale-cache']?.isNotEmpty == true
//           ? 'stale cache'
//           : 'fresh cache';
//       log('📡 ✅ Response served from $cacheType');
//     }

//     handler.next(response);
//   }
// }
