import 'package:flutter/material.dart';
import 'package:movify/l10n/app_localizations.dart';

enum SortBy {
  popularityDesc,
  popularityAsc,
  ratingDesc,
  ratingAsc,
  releaseDateDesc,
  releaseDateAsc,
  firstAirDateDesc,
  firstAirDateAsc,
  revenueDesc,
  revenueAsc,
  voteCountDesc,
  voteCountAsc,
}

extension SortByApi on SortBy {
  String get apiValue => switch (this) {
    SortBy.popularityDesc => 'popularity.desc',
    SortBy.popularityAsc => 'popularity.asc',
    SortBy.ratingDesc => 'vote_average.desc',
    SortBy.ratingAsc => 'vote_average.asc',
    SortBy.releaseDateDesc => 'release_date.desc',
    SortBy.releaseDateAsc => 'release_date.asc',
    SortBy.firstAirDateDesc => 'first_air_date.desc',
    SortBy.firstAirDateAsc => 'first_air_date.asc',
    SortBy.revenueDesc => 'revenue.desc',
    SortBy.revenueAsc => 'revenue.asc',
    SortBy.voteCountDesc => 'vote_count.desc',
    SortBy.voteCountAsc => 'vote_count.asc',
  };
}

extension SortByUiExtension on SortBy {
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      SortBy.popularityDesc => l10n.sortPopularityDesc,
      SortBy.popularityAsc => l10n.sortPopularityAsc,
      SortBy.ratingDesc => l10n.sortRatingDesc,
      SortBy.ratingAsc => l10n.sortRatingAsc,
      SortBy.releaseDateDesc => l10n.sortReleaseDateDesc,
      SortBy.releaseDateAsc => l10n.sortReleaseDateAsc,
      SortBy.firstAirDateDesc => l10n.sortFirstAirDateDesc,
      SortBy.firstAirDateAsc => l10n.sortFirstAirDateAsc,
      SortBy.revenueDesc => l10n.sortRevenueDesc,
      SortBy.revenueAsc => l10n.sortRevenueAsc,
      SortBy.voteCountDesc => l10n.sortVoteCountDesc,
      SortBy.voteCountAsc => l10n.sortVoteCountAsc,
    };
  }
}
