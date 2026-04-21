import 'package:cinemax_app_new/features/search/data/models/search_result.dart';
import 'package:cinemax_app_new/shared/presentation/models/card_display_model.dart';

List<SearchResult> sortSearchResultsByRatingAndDate(
  List<SearchResult> results,
) {
  num getPopularity(SearchResult result) => switch (result) {
    MovieResult(:final movie) => movie.popularity,
    TvShowResult(:final tvShow) => tvShow.popularity,
  };

  String? getDate(SearchResult result) => switch (result) {
    MovieResult(:final movie) => movie.releaseDate,
    TvShowResult(:final tvShow) => tvShow.firstAirDate,
  };

  results.sort((a, b) {
    final ratingCompare = getPopularity(b).compareTo(getPopularity(a));
    if (ratingCompare != 0) {
      return ratingCompare;
    }

    final aDate = getDate(a);
    final bDate = getDate(b);
    if (aDate != null && bDate != null) {
      return bDate.compareTo(aDate);
    }
    return 0;
  });
  return results;
}

List<CardDisplayModel> sortResultsByRatingAndDate(List<CardDisplayModel> results) {
  results.sort((a, b) {
    final ratingCompare = b.popularity!.compareTo(a.popularity!);
    if (ratingCompare != 0) {
      return ratingCompare;
    }
    final aDate = a.date;
    final bDate = b.date;
    if (aDate != null && bDate != null) {
      return bDate.compareTo(aDate);
    }
    return 0;
  });
  return results;
}
