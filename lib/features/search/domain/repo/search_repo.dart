import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/search/domain/entities/search_actor_entity.dart';
import 'package:cinemax_app_new/shared/domain/entites/movie_entity.dart';
import 'package:cinemax_app_new/shared/domain/entites/series_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class SearchRepo {
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query);
  Future<Either<Failure, List<SeriesEntity>>> searchTvShows(String query);
  Future<Either<Failure, List<SearchActorEntity>>> searchActor(String query);
}
