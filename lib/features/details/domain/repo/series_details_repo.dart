import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class SeriesDetailsRepo {
  SeriesDetailsResult fetchSeriesDetails(int seriesId);
  SeriesSeasonDetailsResult fetchSeriesSeasonDetails(
    int seriesId,
    int seasonNumber,
  );
  Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesRecommendations(
    int id,
    int? page,
  );
  Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesSimilarItems(
    int id,
    int? page,
  );
}
