import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

enum TvGenre {
  actionAdventure(10759),
  animation(16),
  comedy(35),
  crime(80),
  documentary(99),
  drama(18),
  family(10751),
  kids(10762),
  mystery(9648),
  news(10763),
  reality(10764),
  sciFiFantasy(10765),
  soap(10766),
  talk(10767),
  warPolitics(10768),
  western(37);

  final int id;
  const TvGenre(this.id);
}

extension TvGenreExtension on TvGenre {
  String localizedText(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      TvGenre.actionAdventure => l10n.genreActionAdventure,
      TvGenre.animation => l10n.genreAnimation,
      TvGenre.comedy => l10n.genreComedy,
      TvGenre.crime => l10n.genreCrime,
      TvGenre.documentary => l10n.genreDocumentary,
      TvGenre.drama => l10n.genreDrama,
      TvGenre.family => l10n.genreFamily,
      TvGenre.kids => l10n.genreKids,
      TvGenre.mystery => l10n.genreMystery,
      TvGenre.news => l10n.genreNews,
      TvGenre.reality => l10n.genreReality,
      TvGenre.sciFiFantasy => l10n.genreSciFiFantasy,
      TvGenre.soap => l10n.genreSoap,
      TvGenre.talk => l10n.genreTalk,
      TvGenre.warPolitics => l10n.genreWarPolitics,
      TvGenre.western => l10n.genreWestern,
    };
  }
}
