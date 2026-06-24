// lib/core/network/api/services/tmdb/tmdb_content_api.dart

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:movify/constant.dart';
import 'package:movify/core/network/api/services/tmdb/tmdb_base_client.dart';
import 'package:movify/core/types/api_types.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/features/discover/domain/enums/sort_by_enum.dart';

/// Unified content API for both movies and TV shows
/// Follows DRY principle - shared endpoints use type parameter
class TmdbContentApi {
  final TmdbBaseClient client;

  TmdbContentApi(this.client);
  final int pageCacheCount = Constants.pageCacheCount;

  ApiResponse getItemsByKeyword({
    int page = 1,
    CancelToken? cancelToken,
    int keyword = 1,
    String type = 'movie',
  }) => client.get(
    'discover/$type',
    queryParams: {
      'with_keywords': keyword.toString(),
      'sort_by': 'vote_count.desc',
      'page': page.toString(),
    },
    cancelToken: cancelToken,
    overridePolicy: page <= pageCacheCount
        ? CachePolicy.request
        : CachePolicy.noCache,
  );

  ApiResponse getItemsByGenre({
    required String type,
    required GenreFilterParams params,
    required int page,
    CancelToken? cancelToken,
  }) => client.get(
    'discover/$type',
    queryParams: {
      'page': page.toString(),
      'sort_by': params.sortBy?.apiValue,
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
    overridePolicy: page <= pageCacheCount
        ? CachePolicy.request
        : CachePolicy.noCache,
  );

  ApiResponse getMovies({
    int page = 1,
    CancelToken? cancelToken,
    String endPoint = 'popular',
  }) => client.get(
    endPoint,
    queryParams: {'page': page.toString()},
    cancelToken: cancelToken,
    overridePolicy: page <= pageCacheCount
        ? CachePolicy.request
        : CachePolicy.noCache,
  );

  ApiResponse getTvShows({
    int page = 1,
    CancelToken? cancelToken,
    String endPoint = 'popular',
  }) => client.get(
    endPoint,
    queryParams: {'page': page.toString()},
    cancelToken: cancelToken,
    overridePolicy: page <= pageCacheCount
        ? CachePolicy.request
        : CachePolicy.noCache,
  );

  ApiResponse getItemCompanies({
    required String companyId,
    required String type,
    int page = 1,
    CancelToken? cancelToken,
  }) => client.get(
    'discover/$type',
    queryParams: {'with_companies': companyId, 'page': page.toString()},
    cancelToken: cancelToken,
    overridePolicy: page <= pageCacheCount
        ? CachePolicy.request
        : CachePolicy.noCache,
  );
}
