import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

enum SeriesCategory { trending, popular, topRated, airingToday }

extension SeriesCategoryExtension on SeriesCategory {
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (this) {
      SeriesCategory.trending => l10n.trending,
      SeriesCategory.popular => l10n.popular,
      SeriesCategory.topRated => l10n.topRated,
      SeriesCategory.airingToday => l10n.airingToday,
    };
  }

  String get endPoint => switch (this) {
    SeriesCategory.trending => 'trending/tv/day',
    SeriesCategory.popular => 'tv/popular',
    SeriesCategory.topRated => 'tv/top_rated',
    SeriesCategory.airingToday => 'tv/on_the_air',
  };
}
