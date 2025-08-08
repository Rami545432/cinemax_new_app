import '../../../features/search/data/models/search_result.dart';
import '../../../models/base_card_model.dart';

List<SearchResult> sortSearchResultsByRatingAndDate(
  List<SearchResult> results,
) {
  num getPopularity(SearchResult result) => switch (result) {
    MovieResult(:final movie) => movie.cardPopularity ?? 0,
    TvShowResult(:final tvShow) => tvShow.cardPopularity ?? 0,
  };

  String? getDate(SearchResult result) => switch (result) {
    MovieResult(:final movie) => movie.cardDate,
    TvShowResult(:final tvShow) => tvShow.cardDate,
  };

  results.sort((a, b) {
    final ratingCompare = getPopularity(b).compareTo(getPopularity(a));
    if (ratingCompare != 0) return ratingCompare;

    final aDate = getDate(a);
    final bDate = getDate(b);
    if (aDate != null && bDate != null) {
      return bDate.compareTo(aDate);
    }
    return 0;
  });
  return results;
}

List<BaseCardModel> sortResultsByRatingAndDate(List<BaseCardModel> results) {
  results.sort((a, b) {
    final ratingCompare = b.cardPopularity!.compareTo(a.cardPopularity!);
    if (ratingCompare != 0) {
      return ratingCompare;
    }
    final aDate = a.cardDate;
    final bDate = b.cardDate;
    if (aDate != null && bDate != null) {
      return bDate.compareTo(aDate);
    }
    return 0;
  });
  return results;
}
