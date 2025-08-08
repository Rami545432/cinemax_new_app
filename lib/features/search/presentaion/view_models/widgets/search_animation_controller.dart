import 'package:flutter/material.dart';

import '../../../data/models/search_result.dart';

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

  String _getItemId(SearchResult result) {
    return switch (result) {
      MovieResult(:final movie) => 'movie-${movie.movieId}',
      TvShowResult(:final tvShow) => 'tv-${tvShow.tvId}',
    };
  }
}
