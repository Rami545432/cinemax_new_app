// ignore_for_file: strict_raw_type

import 'dart:developer';
import 'package:cinemax_app_new/core/network/services/secure_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SecurityInterceptor extends Interceptor {
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  // Get TMDB API key from environment variables
  String get _tmdbApiKey => dotenv.env['TMDB_API_KEY'] ?? '';

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // 1. 🎬 Add TMDB API Key for movie database requests
      if (options.path.contains('themoviedb.org') ||
          options.path.contains('/3/')) {
        if (_tmdbApiKey.isEmpty) {
          log('⚠️ TMDB API key not found in environment variables');
        }
        options.queryParameters['api_key'] = _tmdbApiKey;
        // log('🛡️ Added TMDB API key to ${options.path}');
      }

      // 2. 🔥 Add Firebase Authentication if user is logged in
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        try {
          final token = await user.getIdToken();
          options.headers['Authorization'] = 'Bearer $token';
          options.headers['X-User-ID'] = user.uid;
          options.headers['X-User-Email'] = user.email ?? 'unknown';
          // log('🛡️ Added Firebase auth for user: ${user.uid}');

          // Store token securely for future use
          await SecureStorageService.saveFireBaseToken(token!);
          await SecureStorageService.storeUserId(user.uid);
        } catch (e) {
          // log('🛡️ Error getting Firebase token: $e');
        }
      } else {
        // log('🛡️ No authenticated user - proceeding without auth headers');
      }

      // 3. 📱 Add standard app headers
      options.headers['User-Agent'] = 'CinemaxApp/1.0';
      options.headers['Accept'] = 'application/json';
      options.headers['Accept-Language'] = 'en-US';
      options.headers['X-Platform'] = 'mobile';
      options.headers['X-App-Version'] = '1.0.0';
      options.headers['X-Request-ID'] = DateTime.now().millisecondsSinceEpoch
          .toString();

      // log('🛡️ Security headers added to request');
    } catch (e) {
      // log('🛡️ Security interceptor error in onRequest: $e');
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle authentication errors (401 Unauthorized)
    if (err.response?.statusCode == 401) {
      // log('🛡️ 401 Unauthorized - attempting token refresh');

      try {
        final user = _firebaseAuth.currentUser;
        if (user != null) {
          // log('🛡️ User exists, refreshing Firebase token...');

          // Force refresh the Firebase token
          await user.getIdToken(true);
          final newToken = await user.getIdToken();

          if (newToken != null && newToken.isNotEmpty) {
            // Store new token securely
            await SecureStorageService.saveFireBaseToken(newToken);

            // Update the failed request with new token
            err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

            // log('🛡️ Token refreshed, retrying original request');

            // Retry the original request
            try {
              final response = await Dio().request<void>(
                err.requestOptions.path,
                options: Options(
                  method: err.requestOptions.method,
                  headers: err.requestOptions.headers,
                ),
                data: err.requestOptions.data,
                queryParameters: err.requestOptions.queryParameters,
                cancelToken: err.requestOptions.cancelToken,
              );

              // log('✅ Request retry successful after token refresh');
              handler.resolve(response);
              return;
            } catch (retryError) {
              // log('❌ Request retry failed: $retryError');
            }
          }
        } else {
          // log('🛡️ No current user for token refresh');
        }
      } catch (refreshError) {
        // log('🛡️ Token refresh failed: $refreshError');

        // Clear potentially invalid tokens
        await SecureStorageService.clearAll();
      }
    }

    // Handle API key errors (403 Forbidden)
    if (err.response?.statusCode == 403 &&
        err.requestOptions.path.contains('themoviedb.org')) {
      // log('🛡️ TMDB API key error - check if key is valid or rate limited');
    }

    // Handle other security-related errors
    if (err.response?.statusCode == 429) {
      // log('🛡️ Rate limit exceeded - requests are being throttled');
    }

    // Continue with normal error handling
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log successful authenticated requests
    if (response.requestOptions.headers.containsKey('Authorization')) {
      // log(
      //   '🛡️ Authenticated request completed successfully: ${response.statusCode}',
      // );
    }

    // Check for security warnings in response headers
    if (response.headers['x-security-warning'] != null) {
      // log('⚠️ Security warning: ${response.headers['x-security-warning']}');
    }

    handler.next(response);
  }
}
