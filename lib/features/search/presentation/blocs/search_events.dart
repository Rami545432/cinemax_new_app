// lib/features/search/bloc/search_event.dart

import 'package:equatable/equatable.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchQueryChanged extends SearchEvent {
  final String query;
  const SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class SearchCleared extends SearchEvent {
  const SearchCleared();
}
