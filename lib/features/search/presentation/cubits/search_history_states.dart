import 'package:cinemax_app_new/features/search/domain/entities/search_history_entity.dart';

sealed class SearchHistoryState {
  const SearchHistoryState();
}

class SearchHistoryInitial extends SearchHistoryState {
  const SearchHistoryInitial();
}

class SearchHistoryLoaded extends SearchHistoryState {
  final List<SearchHistoryEntity> searchHistory;
  const SearchHistoryLoaded({required this.searchHistory});
}

class SearchHistoryFailure extends SearchHistoryState {
  final String errorMessage;
  const SearchHistoryFailure({required this.errorMessage});
}

class SearchHistoryLoading extends SearchHistoryState {
  const SearchHistoryLoading();
}

class SearchHistoryEmpty extends SearchHistoryState {
  const SearchHistoryEmpty();
}
