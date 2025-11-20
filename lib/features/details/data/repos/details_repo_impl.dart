import 'package:cinemax_app_new/core/network/api/services/safe_api_calls.dart';
import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/features/details/data/remote_details_data_source/remote_details_data_source.dart';
import 'package:cinemax_app_new/features/details/domain/entites/movie_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/repo/details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DetailsRepoImpl implements DetailsRepo {
  final RemoteDetailsDataSource remoteDetailsDataSource;
  final Map<String, MovieDetailsEntity> _movieCache = {};
  final Map<String, SeriesDetailsEntity> _seriesCache = {};
  DetailsRepoImpl({required this.remoteDetailsDataSource});
  @override
  MovieDetailsResult fetchMovieDetails(
    int movieId,
    CancelToken? cancelToken,
  ) async {
    final cacheKey = 'movie-$movieId';
    if (_movieCache.containsKey(cacheKey)) {
      return Right(_movieCache[cacheKey]!);
    }
    try {
      final data = await remoteDetailsDataSource.fetchMovieDetails(
        movieId,
        cancelToken,
      );
      _movieCache[cacheKey] = data;
      return Right(data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  SeriesDetailsResult fetchSeriesDetails(
    int seriesId,
    CancelToken? cancelToken,
  ) async {
    final cacheKey = 'series-$seriesId';
    if (_seriesCache.containsKey(cacheKey)) {
      return Right(_seriesCache[cacheKey]!);
    }
    try {
      final data = await remoteDetailsDataSource.fetchSeriesDetails(
        seriesId,
        cancelToken,
      );
      _seriesCache[cacheKey] = data;
      return Right(data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  SeriesSeasonDetailsResult fetchSeriesSeasonDetails(
    int seriesId,
    int seasonNumber,
    CancelToken? cancelToken,
  ) async {
    return await safeApiCall(
      () => remoteDetailsDataSource.fetchSeriesSeasonDetails(
        seriesId,
        seasonNumber,
        cancelToken,
      ),
    );
  }

  @override
  RecommendationResult fetchRecommendations(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  ) async {
    return await safeApiCall(
      () => remoteDetailsDataSource.fetchRecommendations(
        id,
        type,
        page,
        cancelToken,
      ),
    );
  }

  @override
  SimilarItemsResult fetchSimilarItems(
    int id,
    String type,
    int? page,
    CancelToken? cancelToken,
  ) async {
    return await safeApiCall(
      () => remoteDetailsDataSource.fetchSimilarItems(
        id,
        type,
        page,
        cancelToken,
      ),
    );
  }
}
