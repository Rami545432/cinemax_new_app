import 'package:cinemax_app_new/features/search/data/models/search_result.dart';
import 'package:flutter/material.dart';

class SearchAnimationController extends ChangeNotifier {
  List<SearchResult> _previousResults = [];
  Set<String> _previousItemIds = {};
  bool _isFirstSearch = true;

  bool get isFirstSearch => _isFirstSearch;

  void updateResults(List<SearchResult> newResults) {
    if (_previousResults != newResults) {
      _previousItemIds = _previousResults
          .map((result) => _getItemId(result))
          .toSet();
      _isFirstSearch = _previousResults.isEmpty;
      _previousResults = newResults;
      notifyListeners();
    }
  }

  bool isNewItem(SearchResult result) {
    final itemId = _getItemId(result);
    return !_previousItemIds.contains(itemId);
  }

  String _getItemId(SearchResult result) => switch (result) {
    MovieResult(:final movie) => 'movie-${movie.id}',
    TvShowResult(:final tvShow) => 'tv-${tvShow.id}',
  };
}
