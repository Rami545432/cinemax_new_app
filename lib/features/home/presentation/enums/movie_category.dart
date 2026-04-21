import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

enum MovieCategory { trending, popular, topRated, upcoming, nowPlaying }

extension MovieCategoryExtension on MovieCategory {
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      MovieCategory.trending => l10n.trending,
      MovieCategory.popular => l10n.popular,
      MovieCategory.topRated => l10n.topRated,
      MovieCategory.upcoming => l10n.upcoming,
      MovieCategory.nowPlaying => l10n.nowPlaying,
    };
  }

  String get endPoint => switch (this) {
    MovieCategory.trending => 'trending/movie/day',
    MovieCategory.popular => 'movie/popular',
    MovieCategory.topRated => 'movie/top_rated',
    MovieCategory.upcoming => 'movie/upcoming',
    MovieCategory.nowPlaying => 'movie/now_playing',
  };
}
