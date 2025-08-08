part of 'fetch_trending_tv_show_cubit.dart';

abstract class FetchTrendingTvShowState {}

class FetchTrendingTvShowInitial extends FetchTrendingTvShowState {}

class FetchTrendingTvShowSuccess extends FetchTrendingTvShowState {
  final List<SeriesEntity> tvShows;

  FetchTrendingTvShowSuccess({required this.tvShows});
}

class FetchTrendingTvShowLoading extends FetchTrendingTvShowState {}

class FetchTrendingTvShowFailure extends FetchTrendingTvShowState {
  final String errorMessage;

  FetchTrendingTvShowFailure({required this.errorMessage});
}

class FetchTrendingTvShowPaginationLoading extends FetchTrendingTvShowState {}
