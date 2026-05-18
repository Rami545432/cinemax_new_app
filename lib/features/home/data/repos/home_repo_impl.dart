import 'package:injectable/injectable.dart';
import 'package:movify/core/network/api/services/safe_api_calls.dart';
import 'package:movify/core/pagination/domain/entites/page_result.dart';
import 'package:movify/core/types/domain_types.dart';
import 'package:movify/features/home/data/data_sources/remote/remote_home_data_source.dart';
import 'package:movify/features/home/domian/repos/home_repo.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({required this.remoteHomeDataSource});
  final RemoteHomeDataSource remoteHomeDataSource;
  @override
  MovieListResult getMovies({int page = 1, String endPoint = 'popular'}) =>
      safeApiCall(() async {
        final modelResult = await remoteHomeDataSource.getMovies(
          page: page,
          endPoint: endPoint,
        );
        return PageResult(
          page: modelResult.page,
          totalPages: modelResult.totalPages,
          totalResults: modelResult.totalResults,
          results: modelResult.results.map((e) => e.toEntity()).toList(),
        );
      });

  @override
  SeriesListResult getTvShows({int page = 1, String endPoint = 'popular'}) =>
      safeApiCall(() async {
        final modelResult = await remoteHomeDataSource.getTvShows(
          page: page,
          endPoint: endPoint,
        );
        return PageResult(
          page: modelResult.page,
          totalPages: modelResult.totalPages,
          totalResults: modelResult.totalResults,
          results: modelResult.results.map((e) => e.toEntity()).toList(),
        );
      });
}
