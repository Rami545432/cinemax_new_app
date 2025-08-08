part of 'fetch_popular_tv_shows_cubit.dart';

abstract class FetchPopularTvShowsState {}

class FetchPopularTvShowsInitial extends FetchPopularTvShowsState {}

class FetchPopularTvShowsSuccess extends FetchPopularTvShowsState {
  final List<SeriesEntity> tvShows;

  FetchPopularTvShowsSuccess({required this.tvShows});
}

class FetchPopularTvShowsFailure extends FetchPopularTvShowsState {
  final String errorMessage;

  FetchPopularTvShowsFailure({required this.errorMessage});
}

class FetchPopularTvShowsLoading extends FetchPopularTvShowsState {}

class FetchPopularTvShowsPaginationLoading extends FetchPopularTvShowsState {}

class FetchPopularTvShowsPaginationFailure extends FetchPopularTvShowsState {}
