import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../domain/entites/series_entity.dart';
import '../../domain/entites/series_season_details_entitiy.dart';
import '../../domain/repos/series_repo.dart';
import '../data_soureces/local_series_tv_data_source.dart';
import '../data_soureces/remote_seires_tv_data_source.dart';
import '../models/series_details_model/series_details_model.dart';

class SeriesRepoImpl implements SeriesRepo {
  final RemoteSeiresTvDataSource remoteSeiresTvDataSource;
  final LocalSeriesTvDataSource localSeriesTvDataSource;

  SeriesRepoImpl(
    this.localSeriesTvDataSource, {
    required this.remoteSeiresTvDataSource,
  });
  @override
  Future<Either<Failure, List<SeriesEntity>>> fetchPopularTvShows(
    generId, {
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      // var cachedTvShows = localSeriesTvDataSource.fetchPopularTvShows(
      //   page: page,
      // );
      // if (cachedTvShows.isNotEmpty) {
      //   return right(cachedTvShows);
      // }
      var tvShows = await remoteSeiresTvDataSource.fetchPopularTvShows(
        generId,
        page: page,
        cancelToken: cancelToken,
      );
      return right(tvShows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<SeriesEntity>>> fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      // var cachedTvShows =
      //     localSeriesTvDataSource.fetchTopRatedTvShows(page: page);
      // if (cachedTvShows.isNotEmpty) {
      //   return right(cachedTvShows);
      // }
      var tvShows = await remoteSeiresTvDataSource.fetchTopRatedTvShows(
        page: page,
        cancelToken: cancelToken,
      );
      return right(tvShows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<SeriesEntity>>> fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      var tvShows = await remoteSeiresTvDataSource.fetchTrendingTvShows(
        page: page,
        cancelToken: cancelToken,
      );
      return right(tvShows);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SeriesDetailsModel>> fetchTvShowDetail({
    required int tvid,
    CancelToken? cancelToken,
  }) async {
    try {
      var tvShow = await remoteSeiresTvDataSource.fetchTvShowDetail(
        tvid: tvid,
        cancelToken: cancelToken,
      );
      return right(tvShow);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SeriesSeasonDetailsEntitiy>> fetchTvShowSeasonDetails({
    required int tvid,
    required num season,
    CancelToken? cancelToken,
  }) async {
    try {
      var results = await remoteSeiresTvDataSource.fetchTvShowSeasonDetails(
        tvid: tvid,
        season: season,
        cancelToken: cancelToken,
      );
      return right(results);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SeriesEntity>>> fetchTvAiringToday({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      var results = await remoteSeiresTvDataSource.fetchAiringTvShows(
        page: page,
        cancelToken: cancelToken,
      );
      return right(results);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
