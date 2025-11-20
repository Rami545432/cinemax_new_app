import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

enum MovieDetailsEnum { about, cast, reviews, recommended, similar }

extension MovieDetailsEnumExtension on MovieDetailsEnum {
  String localizedText(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      MovieDetailsEnum.about => l10n.about,
      MovieDetailsEnum.cast => l10n.cast,
      MovieDetailsEnum.reviews => l10n.reviews,
      MovieDetailsEnum.recommended => l10n.recommended,
      MovieDetailsEnum.similar => l10n.similar,
    };
  }

  Tab localizedTab(BuildContext context) {
    return Tab(text: localizedText(context));
  }
}

enum SeriesDetailsEnum { about, seasons, cast, reviews, recommended, similar }

extension SeriesDetailsEnumExtension on SeriesDetailsEnum {
  String localizedText(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      SeriesDetailsEnum.about => l10n.about,
      SeriesDetailsEnum.seasons => l10n.seasons,
      SeriesDetailsEnum.cast => l10n.cast,
      SeriesDetailsEnum.reviews => l10n.reviews,
      SeriesDetailsEnum.recommended => l10n.recommended,
      SeriesDetailsEnum.similar => l10n.similar,
    };
  }

  Tab localizedTab(BuildContext context) {
    return Tab(text: localizedText(context));
  }
}

enum SeasonDetailsEnum { episodes, about, cast }

extension SeasonDetailsEnumExtension on SeasonDetailsEnum {
  String localizedText(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      SeasonDetailsEnum.episodes => l10n.episodes,
      SeasonDetailsEnum.about => l10n.about,
      SeasonDetailsEnum.cast => l10n.cast,
    };
  }

  Tab localizedTab(BuildContext context) {
    return Tab(text: localizedText(context));
  }
}
