// lib/core/network/api/services/tmdb/tmdb_content_api.dart
import 'dart:developer';

import 'package:cinemax_app_new/core/network/api/services/tmdb/tmdb_base_client.dart';
import 'package:cinemax_app_new/core/types/api_types.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
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
      'trending/$type/day',
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

  ApiResposne getItemsKeywords({int page = 1, CancelToken? cancelToken}) {
    return client.get(
      'keyword/3149/movies',
      queryParams: {'page': page.toString()},
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    );
  }

  ApiResposne getItemsByGenre({
    required String type,
    required GenreFilterParams params,
    CancelToken? cancelToken,
  }) {
    log('params: ${params.genreId}');
    return client.get(
      'discover/$type',
      queryParams: {
        'page': params.page?.toString(),
        'sort_by': params.sortBy?.name,
        'with_keywords': params.withKeywords,
        'with_networks': params.withNetworks,
        'with_companies': params.withCompanies,
        'with_providers': params.withProviders,
        'min_runtime': params.minRuntime?.toString(),
        'max_runtime': params.maxRuntime?.toString(),
        'vote_average.gte': params.minRating?.toString(),
        'vote_average.lte': params.maxRating?.toString(),
        'first_air_date.gte': params.minYear != null
            ? '${params.minYear}-01-01'
            : null,
        'first_air_date.lte': params.maxYear != null
            ? '${params.maxYear}-01-01'
            : null,
        'release_date.gte': params.minYear != null
            ? '${params.minYear}-01-01'
            : null,
        'release_date.lte': params.maxYear != null
            ? '${params.maxYear}-01-01'
            : null,
        'with_genres': params.genreId?.toString(),
      },
      cancelToken: cancelToken,
      overridePolicy: params.page! <= 5
          ? CachePolicy.request
          : CachePolicy.noCache,
    );
  }

  ApiResposne getItemCompanies({
    required String companyId,
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) {
    return client.get(
      'discover/$type',
      queryParams: {'with_companies': companyId, 'page': page.toString()},
      cancelToken: cancelToken,
      overridePolicy: page <= 5 ? CachePolicy.request : CachePolicy.noCache,
    );
  }
}
