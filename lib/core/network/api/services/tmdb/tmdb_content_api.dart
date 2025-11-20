// lib/core/network/api/services/tmdb/tmdb_content_api.dart
import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_base_client.dart';
import 'package:cinemax_app_new/core/types/api_types.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

/// Unified content API for both movies and TV shows
/// Follows DRY principle - shared endpoints use type parameter
class TmdbContentApi {
  final TmdbBaseClient client;

  TmdbContentApi(this.client);

  /// Get popular content (movies or TV) by genre
  ApiResposne getPopular({
    required String type, // 'movie' or 'tv'
    required dynamic genreId,
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return client.get(
      'discover/$type',
      queryParams: {'with_genres': genreId, 'page': page.toString()},
      cancelToken: cancelToken,
      overridePolicy: page <= 3 ? CachePolicy.request : CachePolicy.noCache,
    );
  }

  /// Get trending content (movies or TV)
  ApiResposne getTrending({
    required String type, // 'movie' or 'tv'
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return client.get(
      'trending/$type/week',
      queryParams: {'page': page.toString()},
      cancelToken: cancelToken,
    );
  }

  /// Get top rated content (movies or TV)
  ApiResposne getTopRated({
    required String type, // 'movie' or 'tv'
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return client.get(
      '$type/top_rated',
      queryParams: {'page': page.toString()},
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    );
  }

  /// Get general discover content (movies or TV)
  ApiResposne getGeneral({
    required String type, // 'movie' or 'tv'
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return client.get(
      'discover/$type',
      queryParams: {'page': page.toString()},
      cancelToken: cancelToken,
    );
  }

  // ========== MOVIE-SPECIFIC METHODS ==========

  /// Get upcoming movies (movies only)
  ApiResposne getUpcomingMovies({int page = 1, CancelToken? cancelToken}) {
    return client.get(
      'movie/upcoming',
      queryParams: {'page': page.toString()},
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    );
  }

  /// Get now playing movies (movies only)
  ApiResposne getNowPlayingMovies({int page = 1, CancelToken? cancelToken}) {
    return client.get(
      'movie/now_playing',
      queryParams: {'page': page.toString()},
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    );
  }

  // ========== TV-SPECIFIC METHODS ==========

  /// Get TV shows airing today (TV only)
  ApiResposne getAiringTodayTv({int page = 1, CancelToken? cancelToken}) {
    return client.get(
      'tv/airing_today',
      queryParams: {'page': page.toString()},
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    );
  }
}
