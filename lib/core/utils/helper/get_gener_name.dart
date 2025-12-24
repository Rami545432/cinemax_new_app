import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

String getGenreName(int id, BuildContext context) {
  final l10n = AppLocalizations.of(context);
  switch (id) {
    case 10768:
      return l10n.genreWarPolitics;
    case 10767:
      return l10n.genreTalk;
    case 10763:
      return l10n.genreNews;
    case 10762:
      return l10n.genreKids;
    case 10759:
      return l10n.genreActionAdventure;
    case 10765:
      return l10n.genreSciFiFantasy;
    case 10764:
      return l10n.genreReality;
    case 28:
      return l10n.genreAction;
    case 12:
      return l10n.genreAdventure;
    case 16:
      return l10n.genreAnimation;
    case 35:
      return l10n.genreComedy;
    case 80:
      return l10n.genreCrime;
    case 99:
      return l10n.genreDocumentary;
    case 18:
      return l10n.genreDrama;
    case 10751:
      return l10n.genreFamily;
    case 14:
      return l10n.genreFantasy;
    case 36:
      return l10n.genreHistory;
    case 27:
      return l10n.genreHorror;
    case 10402:
      return l10n.genreMusic;
    case 9648:
      return l10n.genreMystery;
    case 10749:
      return l10n.genreRomance;
    case 878:
      return l10n.genreSciFi;
    case 10770:
      return l10n.genreTvMovie;
    case 53:
      return l10n.genreThriller;
    case 10752:
      return l10n.genreWar;
    case 37:
      return l10n.genreWestern;
    default:
      return "Unknown Genre";
  }
}
