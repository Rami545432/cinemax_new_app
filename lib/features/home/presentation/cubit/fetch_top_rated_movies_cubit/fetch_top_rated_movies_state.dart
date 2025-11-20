import '../../../domian/entites/movie_entity.dart';

abstract class FetchTopRatedMoviesState {}

class FetchTopRatedMoviesInitial extends FetchTopRatedMoviesState {}

class FetchTopRatedMoviesLoading extends FetchTopRatedMoviesState {}

class FetchTopRatedMoviesPaginationLoading extends FetchTopRatedMoviesState {}

class FetchTopRatedMoviesSuccess extends FetchTopRatedMoviesState {
  final List<MovieEntity> movies;
  FetchTopRatedMoviesSuccess({required this.movies});
}

class FetchTopRatedMoviesFailure extends FetchTopRatedMoviesState {
  final String message;
  FetchTopRatedMoviesFailure({required this.message});
}
