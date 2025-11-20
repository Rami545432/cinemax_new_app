import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/features/series/data/data_soureces/remote_seires_tv_data_source.dart';
import 'package:cinemax_app_new/features/series/domain/repos/series_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SeriesRepoImpl implements SeriesRepo {
  final RemoteSeiresTvDataSource remoteSeiresTvDataSource;

  SeriesRepoImpl({required this.remoteSeiresTvDataSource});
  @override
  SeriesListResult fetchPopularTvShows(
    generId, {
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      var tvShows = await remoteSeiresTvDataSource.fetchPopularTvShows(
        generId,
        page: page,
        cancelToken: cancelToken,
      );
      return right(tvShows);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  SeriesListResult fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      var tvShows = await remoteSeiresTvDataSource.fetchTopRatedTvShows(
        page: page,
        cancelToken: cancelToken,
      );
      return right(tvShows);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  SeriesListResult fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      var tvShows = await remoteSeiresTvDataSource.fetchTrendingTvShows(
        page: page,
        cancelToken: cancelToken,
      );
      return right(tvShows);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  SeriesListResult fetchTvAiringToday({
    int page = 1,
    CancelToken? cancelToken,
  }) async {
    try {
      var results = await remoteSeiresTvDataSource.fetchAiringTvShows(
        page: page,
        cancelToken: cancelToken,
      );
      return right(results);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
