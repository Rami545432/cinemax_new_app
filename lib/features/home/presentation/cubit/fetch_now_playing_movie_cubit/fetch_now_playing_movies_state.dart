import '../../../domian/entites/movie_entity.dart';

abstract class FetchNowPlayingMoviesState {}

class FetchNowPlayingMoviesInitial extends FetchNowPlayingMoviesState {}

class FetchNowPlayingMoviesLoading extends FetchNowPlayingMoviesState {}

class FetchNowPlayingMoviesPaginationLoading
    extends FetchNowPlayingMoviesState {}

class FetchNowPlayingMoviesSuccess extends FetchNowPlayingMoviesState {
  final List<MovieEntity> movies;
  FetchNowPlayingMoviesSuccess({required this.movies});
}

class FetchNowPlayingMoviesFailure extends FetchNowPlayingMoviesState {
  final String message;
  FetchNowPlayingMoviesFailure({required this.message});
}
