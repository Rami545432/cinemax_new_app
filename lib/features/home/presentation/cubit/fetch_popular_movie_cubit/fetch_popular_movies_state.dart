part of 'fetch_popular_movies_cubit.dart';

@immutable
abstract class FetchPopularMoviesState {}

class FetchPopularMoviesInitial extends FetchPopularMoviesState {}

class FetchPopularMovieSuccess extends FetchPopularMoviesState {
  final List<MovieEntity> movies;

  FetchPopularMovieSuccess({required this.movies});
}

class FetchPopularMoviesLoading extends FetchPopularMoviesState {}

class FetchPopularMoviesPaginationLoading extends FetchPopularMoviesState {}

class FetchPopularMoviesFailure extends FetchPopularMoviesState {
  final String errorMessage;

  FetchPopularMoviesFailure({required this.errorMessage});
}
