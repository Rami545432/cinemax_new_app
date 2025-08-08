import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/features/series/data/models/series_details_model/series_details_model.dart';
import 'package:cinemax_app_new/features/series/domain/entites/series_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../entites/series_season_details_entitiy.dart';

abstract class SeriesRepo {
  Future<Either<Failure, List<SeriesEntity>>> fetchTrendingTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, List<SeriesEntity>>> fetchPopularTvShows(
    dynamic generId, {
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, List<SeriesEntity>>> fetchTopRatedTvShows({
    int page = 1,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, SeriesDetailsModel>> fetchTvShowDetail({
    required int tvid,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, SeriesSeasonDetailsEntitiy>> fetchTvShowSeasonDetails({
    required int tvid,
    required num season,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, List<SeriesEntity>>> fetchTvAiringToday({
    int page = 1,
    CancelToken? cancelToken,
  });
}
