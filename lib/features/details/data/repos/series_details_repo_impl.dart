import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/pagination/domain/entites/page_result.dart';
import 'package:cinemax_app_new/features/details/data/data_sources/remote/series/remote_series_details_data_source.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_details_entity.dart';
import 'package:cinemax_app_new/features/details/domain/entites/series_season_details_entitiy.dart';
import 'package:cinemax_app_new/features/details/domain/repo/series_details_repo.dart';
import 'package:cinemax_app_new/shared/data/cache/in_memory_cache.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SeriesDetailsRepo)
class SeriesDetailsRepoImpl implements SeriesDetailsRepo {
  final RemoteSeriesDetailsDataSource remoteSeriesDetailsDataSource;
  SeriesDetailsRepoImpl({required this.remoteSeriesDetailsDataSource});

  final _seriesCache = InMemoryCache<SeriesDetailsEntity>(
    duration: const Duration(minutes: 30),
  );
  final _seasonCache = InMemoryCache<SeriesSeasonDetailsEntity>(
    duration: const Duration(minutes: 15),
  );
  final _seriesRecommendationCache = InMemoryCache<PageResult<SeriesEntity>>(
    duration: const Duration(minutes: 15),
  );
  final _seriesSimilarCache = InMemoryCache<PageResult<SeriesEntity>>(
    duration: const Duration(minutes: 15),
  );
  @override
  SeriesDetailsResult fetchSeriesDetails(int seriesId) async {
    final key = 'series-$seriesId';
    final cached = _seriesCache.get(key);
    if (cached != null) {
      return Right(cached);
    }
    try {
      final data = await remoteSeriesDetailsDataSource.fetchSeriesDetails(
        seriesId,
      );
      final entity = data.toEntity();
      _seriesCache.set(key, entity);
      return Right(entity);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesRecommendations(
    int id,
    int? page,
  ) async {
      final key = 'series_recommendations-$id-$page';
      final cached = _seriesRecommendationCache.get(key);
      if (cached != null) {
        return Right(cached);
      }
      try {
        final data = await remoteSeriesDetailsDataSource.fetchSeriesRecommendations(
          id,
          page,
        );
        final entity = data.map((e) => e.toEntity());
        _seriesRecommendationCache.set(key, entity);
        return Right(entity);
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
  }

  @override
  SeriesSeasonDetailsResult fetchSeriesSeasonDetails(
    int seriesId,
    int seasonNumber,
  ) async {
    final key = 'series_season-$seriesId-$seasonNumber';
    final cached = _seasonCache.get(key);
    if (cached != null) {
      return Right(cached);
    }
    try {
      final data = await remoteSeriesDetailsDataSource.fetchSeriesSeasonDetails(
        seriesId,
        seasonNumber,
      );
      final entity = data.toEntity();
      _seasonCache.set(key, entity);
      return Right(entity); 
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesSimilarItems(
    int id,
    int? page,
  ) async {
   final key = 'series_similar-$id-$page';
   final cached = _seriesSimilarCache.get(key);
   if (cached != null) {
     return Right(cached);
   }
   try {
     final data = await remoteSeriesDetailsDataSource.fetchSeriesSimilar(
       id,
       page,
     );
     final entity = data.map((e) => e.toEntity());
     _seriesSimilarCache.set(key, entity);
     return Right(entity);
   } catch (e) {
     return Left(ServerFailure(errorMessage: e.toString()));
   }
  }
}
