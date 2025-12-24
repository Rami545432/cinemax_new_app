import 'package:cinemax_app_new/core/network/api/services/safe_api_calls.dart';
import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/features/discover/data/data_sourece/discover_remote_data_source.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/features/discover/domain/repos/discover_repo.dart';
import 'package:dio/dio.dart';

class DiscoverRepoImpl implements DiscoverRepo {
  final DiscoverRemoteDataSource remoteDataSource;
  DiscoverRepoImpl({required this.remoteDataSource});
  @override
  MovieListResult fetchMoviesByGenre(
    GenreFilterParams params,
    CancelToken? cancelToken,
  ) {
    return safeApiCall(
      () => remoteDataSource.fetchMoviesByGenre(params, cancelToken),
    );
  }

  @override
  SeriesListResult fetchSeriesByGenre(
    GenreFilterParams params,
    CancelToken? cancelToken,
  ) {
    return safeApiCall(
      () => remoteDataSource.fetchSeriesByGenre(params, cancelToken),
    );
  }
}
