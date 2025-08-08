import '../../../domian/entites/entity.dart';

abstract class FetchTrendingMovieState {}

class FetchTrendingMovieInitial extends FetchTrendingMovieState {}

class FetchTrendingMovieLoading extends FetchTrendingMovieState {}

class FetchTrendingMoviePaginationLoading extends FetchTrendingMovieState {}

class FetchTrendingMovieSuccess extends FetchTrendingMovieState {
  final List<MovieEntity> movies;
  FetchTrendingMovieSuccess({required this.movies});
}

class FetchTrendingMovieFailure extends FetchTrendingMovieState {
  final String message;
  FetchTrendingMovieFailure({required this.message});
}
