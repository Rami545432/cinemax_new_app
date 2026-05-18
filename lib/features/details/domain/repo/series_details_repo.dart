import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/core/types/domain_types.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

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
