// lib/features/search/cubit/search_state.dart

import 'package:cinemax_app_new/features/search/data/models/search_result.dart';
import 'package:equatable/equatable.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  final List<SearchResult> results;
  final List<SearchResult> movies;
  final List<SearchResult> tvShows;
  const SearchLoaded({
    required this.results,
    required this.movies,
    required this.tvShows,
  });

  @override
  List<Object?> get props => [results, movies, tvShows];
}

class SearchError extends SearchState {
  final String errorMessage;
  const SearchError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
