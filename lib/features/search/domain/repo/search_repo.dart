import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/search/domain/entities/search_actor_entity.dart';
import 'package:movify/shared/domain/entites/movie_entity.dart';
import 'package:movify/shared/domain/entites/series_entity.dart';

abstract interface class SearchRepo {
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query);
  Future<Either<Failure, List<SeriesEntity>>> searchTvShows(String query);
  Future<Either<Failure, List<SearchActorEntity>>> searchActor(String query);
}
