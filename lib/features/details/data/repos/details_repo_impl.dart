// import 'package:cinemax_app_new/core/errors/errors.dart';
// import 'package:cinemax_app_new/core/types/domain_types.dart';
// import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
// import 'package:cinemax_app_new/features/details/data/data_sources/remote/remote_details_data_source.dart';
// import 'package:cinemax_app_new/features/details/domain/value_objects/episode.dart';
// import 'package:cinemax_app_new/features/details/domain/entites/collection_entity.dart';
// import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
// import 'package:cinemax_app_new/features/details/domain/entites/series_details_entity.dart';
// import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
// import 'package:cinemax_app_new/features/details/domain/repo/details_repo.dart';
// import 'package:cinemax_app_new/features/home/data/models/movie_model.dart';
// import 'package:cinemax_app_new/features/home/data/models/series_model.dart';
// import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
// import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';

// @LazySingleton(as: DetailsRepo)
// class DetailsRepoImpl implements DetailsRepo {
//   final RemoteDetailsDataSource remoteDetailsDataSource;

//   // Caches with expiry tracking
//   final Map<String, _CachedData<MovieDetailsEntity>> _movieCache = {};
//   final Map<String, _CachedData<SeriesDetailsEntity>> _seriesCache = {};
//   final Map<String, _CachedData<SeriesSeasonDetailsEntity>> _seasonCache = {};
//   final Map<String, _CachedData<PageResult<MovieModel>>>
//   _moviesRecommendationCache = {};
//   final Map<String, _CachedData<PageResult<SeriesModel>>>
//   _seriesRecommendationCache = {};
//   final Map<String, _CachedData<PageResult<MovieModel>>> _moviesSimilarCache =
//       {};
//   final Map<String, _CachedData<PageResult<SeriesModel>>> _seriesSimilarCache =
//       {};
//   final Map<String, _CachedData<CollectionEntity>> _collectionCache = {};

//   static const _detailsCacheDuration = Duration(minutes: 30);
//   static const _listCacheDuration = Duration(minutes: 15); // Shorter for lists

//   DetailsRepoImpl({required this.remoteDetailsDataSource});

//   // ============= MOVIE DETAILS =============
//   @override
//   MovieDetailsResult fetchMovieDetails(int movieId) async {
//     final cacheKey = 'movie-$movieId';

//     // Check cache
//     if (_movieCache.containsKey(cacheKey)) {
//       final cached = _movieCache[cacheKey]!;
//       if (!_isExpired(cached.cachedAt, _detailsCacheDuration)) {
//         return Right(cached.data);
//       } else {
//         _movieCache.remove(cacheKey);
//       }
//     }

//     // Fetch from API
//     try {
//       final data = await remoteDetailsDataSource.fetchMovieDetails(movieId);

//       // Cache with timestamp
//       _movieCache[cacheKey] = _CachedData(
//         data: data.toEntity(),
//         cachedAt: DateTime.now(),
//       );

//       return Right(data.toEntity());
//     } catch (e) {
//       return Left(ServerFailure(errorMessage: e.toString()));
//     }
//   }

//   // ============= SERIES DETAILS =============
//   @override
//   SeriesDetailsResult fetchSeriesDetails(int seriesId) async {
//     final cacheKey = 'series-$seriesId';

//     // Check cache
//     if (_seriesCache.containsKey(cacheKey)) {
//       final cached = _seriesCache[cacheKey]!;
//       if (!_isExpired(cached.cachedAt, _detailsCacheDuration)) {
//         return Right(cached.data);
//       } else {
//         _seriesCache.remove(cacheKey);
//       }
//     }

//     // Fetch from API
//     try {
//       final data = await remoteDetailsDataSource.fetchSeriesDetails(seriesId);

//       // Cache with timestamp
//       _seriesCache[cacheKey] = _CachedData(
//         data: data.toEntity(),
//         cachedAt: DateTime.now(),
//       );

//       return Right(data.toEntity());
//     } catch (e) {
//       return Left(ServerFailure(errorMessage: e.toString()));
//     }
//   }

//   // ============= SEASON DETAILS =============
//   @override
//   SeriesSeasonDetailsResult fetchSeriesSeasonDetails(
//     int seriesId,
//     int seasonNumber,
//   ) async {
//     final cacheKey = 'season-$seriesId-$seasonNumber';

//     // Check cache
//     if (_seasonCache.containsKey(cacheKey)) {
//       final cached = _seasonCache[cacheKey]!;
//       if (!_isExpired(cached.cachedAt, _detailsCacheDuration)) {
//         return Right(cached.data);
//       } else {
//         _seasonCache.remove(cacheKey);
//       }
//     }

//     // Fetch from API
//     try {
//       final data = await remoteDetailsDataSource.fetchSeriesSeasonDetails(
//         seriesId,
//         seasonNumber,
//       );

//       // Cache with timestamp
//       _seasonCache[cacheKey] = _CachedData(
//         data: data,
//         cachedAt: DateTime.now(),
//       );

//       return Right(data);
//     } catch (e) {
//       return Left(ServerFailure(errorMessage: e.toString()));
//     }
//   }

//   // Helper: Get episode from cached season (for episode navigation optimization)
//   Episode? getCachedEpisode({
//     required int seriesId,
//     required int seasonNumber,
//     required int episodeNumber,
//   }) {
//     final cacheKey = 'season-$seriesId-$seasonNumber';
//     final cached = _seasonCache[cacheKey];

//     if (cached == null || _isExpired(cached.cachedAt, _detailsCacheDuration)) {
//       return null;
//     }

//     return cached.data.seasonEpisodes.firstWhere(
//       (e) => e.episodeNumber == episodeNumber,
//       orElse: () => throw ServerFailure(errorMessage: 'Episode not found'),
//     );
//   }

//   // ============= RECOMMENDATIONS =============

//   @override
//   Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesRecommendations(
//     int id,
//     int? page,
//   ) async {
//     final cacheKey = 'recommendation-movie-$id-${page ?? 1}';

//     // Check cache
//     if (_moviesSimilarCache.containsKey(cacheKey)) {
//       final cached = _moviesSimilarCache[cacheKey]!;
//       if (!_isExpired(cached.cachedAt, _listCacheDuration)) {
//         return Right(cached.data.map((e) => e.toEntity()));
//       } else {
//         _moviesSimilarCache.remove(cacheKey);
//       }
//     }

//     // Fetch from API
//     try {
//       final data = await remoteDetailsDataSource.fetchMoviesRecommendations(id, page);

//       // Cache with timestamp
//       _moviesSimilarCache[cacheKey] = _CachedData(
//         data: data,
//         cachedAt: DateTime.now(),
//       );

//       return Right(data.map((e) => e.toEntity()));
//     } catch (e) {
//       return Left(ServerFailure(errorMessage: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesRecommendations(
//     int id,
//     int? page,
//   ) async {
//     final cacheKey = 'recommendation-series-$id-${page ?? 1}';

//     // Check cache
//     if (_seriesSimilarCache.containsKey(cacheKey)) {
//       final cached = _seriesSimilarCache[cacheKey]!;
//       if (!_isExpired(cached.cachedAt, _listCacheDuration)) {
//         return Right(cached.data.map((e) => e.toEntity()));
//       } else {
//         _seriesSimilarCache.remove(cacheKey);
//       }
//     }

//     // Fetch from API
//     try {
//       final data = await remoteDetailsDataSource.fetchSeriesRecommendations(id, page);

//       // Cache with timestamp
//       _seriesSimilarCache[cacheKey] = _CachedData(
//         data: data,
//         cachedAt: DateTime.now(),
//       );

//       return Right(data.map((e) => e.toEntity()));
//     } catch (e) {
//       return Left(ServerFailure(errorMessage: e.toString()));
//     }
//   }

//   // ============= SIMILAR ITEMS =============
//   @override
//   Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesSimilarItems(
//     int id,
//     int? page,
//   ) async {
//     final cacheKey = 'similar-movie-$id-${page ?? 1}';

//     // Check cache
//     if (_moviesSimilarCache.containsKey(cacheKey)) {
//       final cached = _moviesSimilarCache[cacheKey]!;
//       if (!_isExpired(cached.cachedAt, _listCacheDuration)) {
//         return Right(cached.data.map((e) => e.toEntity()));
//       } else {
//         _moviesSimilarCache.remove(cacheKey);
//       }
//     }

//     // Fetch from API
//     try {
//       final data = await remoteDetailsDataSource.fetchMoviesSimilar(id, page);

//       // Cache with timestamp
//       _moviesSimilarCache[cacheKey] = _CachedData(
//         data: data,
//         cachedAt: DateTime.now(),
//       );

//       return Right(data.map((e) => e.toEntity()));
//     } catch (e) {
//       return Left(ServerFailure(errorMessage: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesSimilarItems(
//     int id,
//     int? page,
//   ) async {
//     final cacheKey = 'similar-series-$id-${page ?? 1}';

//     // Check cache
//     if (_seriesSimilarCache.containsKey(cacheKey)) {
//       final cached = _seriesSimilarCache[cacheKey]!;
//       if (!_isExpired(cached.cachedAt, _listCacheDuration)) {
//         return Right(cached.data.map((e) => e.toEntity()));
//       } else {
//         _seriesSimilarCache.remove(cacheKey);
//       }
//     }

//     // Fetch from API
//     try {
//       final data = await remoteDetailsDataSource.fetchSeriesSimilar(id, page);

//       // Cache with timestamp
//       _seriesSimilarCache[cacheKey] = _CachedData(
//         data: data,
//         cachedAt: DateTime.now(),
//       );

//       return Right(data.map((e) => e.toEntity()));
//     } catch (e) {
//       return Left(ServerFailure(errorMessage: e.toString()));
//     }
//   }

//   // ============= COLLECTION =============
//   @override
//   CollectionResult fetchCollection(int collectionId) async {
//     final cacheKey = 'collection-$collectionId';

//     // Check cache
//     if (_collectionCache.containsKey(cacheKey)) {
//       final cached = _collectionCache[cacheKey]!;
//       if (!_isExpired(cached.cachedAt, _detailsCacheDuration)) {
//         return Right(cached.data);
//       } else {
//         _collectionCache.remove(cacheKey);
//       }
//     }

//     // Fetch from API
//     try {
//       final data = await remoteDetailsDataSource.fetchCollection(collectionId);

//       // Cache with timestamp
//       _collectionCache[cacheKey] = _CachedData(
//         data: data.toEntity(),
//         cachedAt: DateTime.now(),
//       );

//       return Right(data.toEntity());
//     } catch (e) {
//       return Left(ServerFailure(errorMessage: e.toString()));
//     }
//   }

//   // ============= CACHE MANAGEMENT =============

//   /// Clear all caches
//   void clearAllCaches() {
//     _movieCache.clear();
//     _seriesCache.clear();
//     _seasonCache.clear();
//     _moviesRecommendationCache.clear();
//     _seriesRecommendationCache.clear();
//     _moviesSimilarCache.clear();
//     _seriesSimilarCache.clear();
//     _collectionCache.clear();
//   }

//   /// Clear specific content cache
//   void clearMovieCache(int movieId) {
//     _movieCache.remove('movie-$movieId');
//   }

//   void clearSeriesCache(int seriesId) {
//     _seriesCache.remove('series-$seriesId');
//   }

//   void clearSeasonCache(int seriesId, int seasonNumber) {
//     _seasonCache.remove('season-$seriesId-$seasonNumber');
//   }

//   /// Clear expired caches (optional - call periodically)
//   void clearExpiredCaches() {
//     _movieCache.removeWhere(
//       (_, cached) => _isExpired(cached.cachedAt, _detailsCacheDuration),
//     );
//     _seriesCache.removeWhere(
//       (_, cached) => _isExpired(cached.cachedAt, _detailsCacheDuration),
//     );
//     _seasonCache.removeWhere(
//       (_, cached) => _isExpired(cached.cachedAt, _detailsCacheDuration),
//     );
//     _moviesRecommendationCache.removeWhere(
//       (_, cached) => _isExpired(cached.cachedAt, _listCacheDuration),
//     );
//     _seriesRecommendationCache.removeWhere(
//       (_, cached) => _isExpired(cached.cachedAt, _listCacheDuration),
//     );
//     _moviesSimilarCache.removeWhere(
//       (_, cached) => _isExpired(cached.cachedAt, _listCacheDuration),
//     );
//     _seriesSimilarCache.removeWhere(
//       (_, cached) => _isExpired(cached.cachedAt, _listCacheDuration),
//     );
//     _collectionCache.removeWhere(
//       (_, cached) => _isExpired(cached.cachedAt, _detailsCacheDuration),
//     );
//   }

//   // ============= HELPER METHODS =============

//   bool _isExpired(DateTime cachedAt, Duration duration) =>
//       DateTime.now().difference(cachedAt) > duration;
// }

// // ============= CACHE DATA CLASS =============

// class _CachedData<T> {
//   final T data;
//   final DateTime cachedAt;

//   _CachedData({required this.data, required this.cachedAt});
// }
