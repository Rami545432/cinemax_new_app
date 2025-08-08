part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<SearchResult> results;
  final List<SearchResult> movies;
  final List<SearchResult> tvShows;
  SearchSuccess({
    required this.results,
    required this.movies,
    required this.tvShows,
  });
}

class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure({required this.errorMessage});
}

class SearchLoading extends SearchState {}

class SearchHistorySuccess extends SearchState {
  final List<SearchHistoryModel> searchHistory;
  SearchHistorySuccess({required this.searchHistory});
}
