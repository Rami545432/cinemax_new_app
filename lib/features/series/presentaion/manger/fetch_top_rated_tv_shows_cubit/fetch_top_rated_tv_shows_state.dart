part of 'fetch_top_rated_tv_shows_cubit.dart';

abstract class FetchTopRatedTvShowsState extends Equatable {}

class FetchTopRatedTvShowsInitial extends FetchTopRatedTvShowsState {
  @override
  List<Object?> get props => [];
}

class FetchTopRatedTvShowsLoading extends FetchTopRatedTvShowsState {
  @override
  List<Object?> get props => [];
}

class FetchTopRatedTvShowsSuccess extends FetchTopRatedTvShowsState {
  final List<BaseCardModel> tvShows;

  FetchTopRatedTvShowsSuccess({required this.tvShows});

  @override
  List<Object?> get props => [tvShows];
}

class FetchTopRatedTvShowsFailure extends FetchTopRatedTvShowsState {
  final String errorMessage;

  FetchTopRatedTvShowsFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
