import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

enum MovieGenre {
  action(28),
  adventure(12),
  animation(16),
  comedy(35),
  crime(80),
  documentary(99),
  drama(18),
  family(10751),
  fantasy(14),
  history(36),
  horror(27),
  music(10402),
  mystery(9648),
  romance(10749),
  scienceFiction(878),
  tvMovie(10770),
  thriller(53),
  war(10752),
  western(37);

  final int id;
  const MovieGenre(this.id);
}

extension MovieGenreExtension on MovieGenre {
  String localizedText(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      MovieGenre.action => l10n.genreAction,
      MovieGenre.adventure => l10n.genreAdventure,
      MovieGenre.animation => l10n.genreAnimation,
      MovieGenre.comedy => l10n.genreComedy,
      MovieGenre.crime => l10n.genreCrime,
      MovieGenre.documentary => l10n.genreDocumentary,
      MovieGenre.drama => l10n.genreDrama,
      MovieGenre.family => l10n.genreFamily,
      MovieGenre.fantasy => l10n.genreFantasy,
      MovieGenre.history => l10n.genreHistory,
      MovieGenre.horror => l10n.genreHorror,
      MovieGenre.music => l10n.genreMusic,
      MovieGenre.mystery => l10n.genreMystery,
      MovieGenre.romance => l10n.genreRomance,
      MovieGenre.scienceFiction => l10n.genreSciFi,
      MovieGenre.tvMovie => l10n.genreTvMovie,
      MovieGenre.thriller => l10n.genreThriller,
      MovieGenre.war => l10n.genreWar,
      MovieGenre.western => l10n.genreWestern,
    };
  }
}
