import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/network/api/services/safe_api_calls.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/features/discover/data/data_sources/remote_discover_data_source.dart';
import 'package:movify/features/discover/domain/entities/genre_filter.dart';
import 'package:movify/features/discover/domain/repos/discover_repo.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

@LazySingleton(as: DiscoverRepo)
class DiscoverRepoImpl implements DiscoverRepo {
  final DiscoverRemoteDataSource remoteDataSource;
  DiscoverRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesByGenre(
    int genreId,
    int page,
    GenreFilterParams params,
  ) => safeApiCall(() async {
    final modelResult = await remoteDataSource.fetchMoviesByGenre(
      genreId,
      page,
      params,
    );
    return PageResult(
      page: modelResult.page,
      totalPages: modelResult.totalPages,
      totalResults: modelResult.totalResults,
      results: modelResult.results.map((e) => e.toEntity()).toList(),
    );
  });

  @override
  Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesByGenre(
    int genreId,
    int page,
    GenreFilterParams params,
  ) => safeApiCall(() async {
    final modelResult = await remoteDataSource.fetchSeriesByGenre(
      genreId,
      page,
      params,
    );
    return PageResult(
      page: modelResult.page,
      totalPages: modelResult.totalPages,
      totalResults: modelResult.totalResults,
      results: modelResult.results.map((e) => e.toEntity()).toList(),
    );
  });

  @override
  Future<Either<Failure, PageResult<MovieEntity>>> fetchMoviesItemsByKeyword(
    int page,
    int keyword,
  ) => safeApiCall(() async {
    final modelResult = await remoteDataSource.fetchMoviesItemsByKeyword(
      page,
      keyword,
    );
    return PageResult(
      page: modelResult.page,
      totalPages: modelResult.totalPages,
      totalResults: modelResult.totalResults,
      results: modelResult.results.map((e) => e.toEntity()).toList(),
    );
  });

  @override
  Future<Either<Failure, PageResult<SeriesEntity>>> fetchSeriesItemsByKeyword(
    int page,
    int keyword,
  ) => safeApiCall(() async {
    final modelResult = await remoteDataSource.fetchSeriesItemsByKeyword(
      page,
      keyword,
    );
    return PageResult(
      page: modelResult.page,
      totalPages: modelResult.totalPages,
      totalResults: modelResult.totalResults,
      results: modelResult.results.map((e) => e.toEntity()).toList(),
    );
  });
}
