import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/remote/remote_search_data_source.dart';
import 'package:cinemax_app_new/features/search/domain/entities/search_actor_entity.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_repo.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final RemoteSearchDataSource remoteDataSource;

  SearchRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query) async {
    try {
      final suggestions = await remoteDataSource.searchMovies(query);
      return right(suggestions.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SearchActorEntity>>> searchActor(
    String query,
  ) async {
    try {
      final suggestions = await remoteDataSource.searchActors(query);
      return right(suggestions);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SeriesEntity>>> searchTvShows(
    String query,
  ) async {
    try {
      final results = await remoteDataSource.searchSeries(query);
      return right(results.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
