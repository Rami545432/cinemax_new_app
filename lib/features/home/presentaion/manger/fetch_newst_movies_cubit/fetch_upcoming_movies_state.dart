import '../../../domian/entites/entity.dart';

abstract class FetchNewsetMoviesState {}

class FetchNewsetMoviesInitial extends FetchNewsetMoviesState {}

class FetchNewsetMoviesSuccess extends FetchNewsetMoviesState {
  final List<MovieEntity> movies;

  FetchNewsetMoviesSuccess({required this.movies});
}

class FetchNewsetMoviesFailure extends FetchNewsetMoviesState {
  final String errorMessage;

  FetchNewsetMoviesFailure({required this.errorMessage});
}

class FetchNewsetMoviesLoading extends FetchNewsetMoviesState {}

class FetchNewsetMoviesPagination extends FetchNewsetMoviesState {}
