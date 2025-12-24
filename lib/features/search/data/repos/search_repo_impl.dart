import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/features/home/domian/entites/movie_entity.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/local_search_data_source.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/remote_search_data_source.dart';
import 'package:cinemax_app_new/features/search/data/models/search_history_model.dart';
import 'package:cinemax_app_new/features/search/domain/entities/search_actor_entity.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_repo.dart';
import 'package:cinemax_app_new/features/home/domian/entites/series_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final RemoteSearchDataSource remoteDataSource;
  final LocalSearchDataSource localSearchDataSource;

  SearchRepoImpl({
    required this.remoteDataSource,
    required this.localSearchDataSource,
  });
  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(
    String query,
    CancelToken? cancelToken,
  ) async {
    try {
      var suggestions = await remoteDataSource.searchMovies(query, cancelToken);
      return right(suggestions);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SearchActorEntity>>> searchActor(
    String query,
    CancelToken? cancelToken,
  ) async {
    try {
      var suggestions = await remoteDataSource.searchActors(query, cancelToken);
      return right(suggestions);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SeriesEntity>>> searchTvShows(
    String query,
    CancelToken? cancelToken,
  ) async {
    try {
      var results = await remoteDataSource.searchTvShows(query, cancelToken);
      return right(results);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> addToSearchHistory(SearchHistoryModel searchHistory) async {
    await localSearchDataSource.addToSearchHistory(searchHistory);
  }

  @override
  Future<void> clearSearchHistory() async {
    await localSearchDataSource.clearSearchHistory();
  }

  @override
  Future<List<SearchHistoryModel>> getSearchHistory() async {
    return await localSearchDataSource.getSearchHistory();
  }

  @override
  Future<void> deleteSearchHistory(int id) async {
    await localSearchDataSource.deleteSearchHistory(id);
  }
}
