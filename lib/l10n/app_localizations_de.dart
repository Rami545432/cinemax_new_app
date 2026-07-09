// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String welcomeUser(String username) {
    return 'Willkommen, $username!';
  }

  @override
  String get authLogin => 'Anmelden';

  @override
  String get authRegister => 'Konto erstellen';

  @override
  String get authEmail => 'E-Mail-Adresse';

  @override
  String get authPassword => 'Passwort';

  @override
  String get authForgotPassword => 'Passwort vergessen?';

  @override
  String get authResetPassword => 'Passwort zurücksetzen';

  @override
  String get authResetPasswordSuccess =>
      'Passwort wurde erfolgreich zurückgesetzt';

  @override
  String get authResetPasswordError =>
      'Zurücksetzen des Passworts fehlgeschlagen';

  @override
  String get authSignInWith => 'Oder anmelden mit';

  @override
  String get authLogout => 'Abmelden';

  @override
  String get popular => 'Am beliebtesten';

  @override
  String get nowPlaying => 'Jetzt im Kino';

  @override
  String get topRated => 'Bestbewertet';

  @override
  String get upcoming => 'Demnächst';

  @override
  String get trending => 'Im Trend';

  @override
  String get search => 'Suche';

  @override
  String get searchHint => 'Nach einem Film oder einer Serie suchen...';

  @override
  String get searchHistory => 'Suchverlauf';

  @override
  String get clearHistory => 'Verlauf löschen';

  @override
  String get about => 'Über';

  @override
  String get cast => 'Besetzung';

  @override
  String get similar => 'Ähnliche Titel';

  @override
  String get recommended => 'Empfohlen';

  @override
  String get reviews => 'Rezensionen';

  @override
  String get seasons => 'Staffeln';

  @override
  String get episodes => 'Folgen';

  @override
  String get network => 'Sender';

  @override
  String get productionCompany => 'Produktionsfirma';

  @override
  String get movieGenres => 'Filmgenres';

  @override
  String get tvGenres => 'Seriengenres';

  @override
  String get all => 'Alle';

  @override
  String get movies => 'Filme';

  @override
  String get tvShows => 'Serien';

  @override
  String get originalTitle => 'Originaltitel';

  @override
  String get releaseDate => 'Erscheinungsdatum';

  @override
  String get runtime => 'Laufzeit';

  @override
  String get status => 'Status';

  @override
  String get language => 'Sprache';

  @override
  String get budget => 'Budget';

  @override
  String get revenue => 'Einnahmen';

  @override
  String get overview => 'Beschreibung';

  @override
  String get storyLine => 'Handlung';

  @override
  String get noDescriptionAvailable => 'Keine Beschreibung verfügbar';

  @override
  String get less => 'Weniger';

  @override
  String get more => 'Mehr';

  @override
  String get geners => 'Kategorien';

  @override
  String get countries => 'Produktionsländer';

  @override
  String get informations => 'Informationen';

  @override
  String get trailers => 'Trailer';

  @override
  String get profile => 'Konto';

  @override
  String get theme => 'Design';

  @override
  String get system => 'System';

  @override
  String get light => 'Heller Modus';

  @override
  String get dark => 'Dunkler Modus';

  @override
  String get favorites => 'Favoriten';

  @override
  String get myProfile => 'Mein Konto';

  @override
  String get noItemsFound => 'Keine Elemente verfügbar';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get noInternetConnection => 'Keine Internetverbindung';

  @override
  String nofavorites(String type) {
    return 'Keine $type in den Favoriten';
  }

  @override
  String startAddingYourFavorite(String type) {
    return 'Füge deine bevorzugten $type hinzu';
  }

  @override
  String get noTrailersAvailable => 'Keine Trailer verfügbar';

  @override
  String get noSeasonsAvailable => 'Keine Staffeln verfügbar';

  @override
  String get noEpisodesAvailable => 'Keine Folgen verfügbar';

  @override
  String get noReviewsAvailable => 'Keine Rezensionen verfügbar';

  @override
  String get signInHint =>
      'Melde dich an, um Favoriten und Serien zu synchronisieren und weitere Funktionen zu nutzen';

  @override
  String get airingToday => 'Heute im Programm';

  @override
  String get discover => 'Entdecken';

  @override
  String get genreAction => 'Action';

  @override
  String get genreAdventure => 'Abenteuer';

  @override
  String get genreAnimation => 'Animation';

  @override
  String get genreComedy => 'Komödie';

  @override
  String get genreCrime => 'Krimi';

  @override
  String get genreDocumentary => 'Dokumentarfilm';

  @override
  String get genreDrama => 'Drama';

  @override
  String get genreFamily => 'Familie';

  @override
  String get genreFantasy => 'Fantasy';

  @override
  String get genreHistory => 'Historie';

  @override
  String get genreHorror => 'Horror';

  @override
  String get genreMusic => 'Musik';

  @override
  String get genreMystery => 'Mystery';

  @override
  String get genreRomance => 'Romantik';

  @override
  String get genreSciFi => 'Science-Fiction';

  @override
  String get genreTvMovie => 'TV-Film';

  @override
  String get genreThriller => 'Thriller';

  @override
  String get genreWar => 'Krieg';

  @override
  String get genreWestern => 'Western';

  @override
  String get genreActionAdventure => 'Action & Abenteuer';

  @override
  String get genreKids => 'Kinder';

  @override
  String get genreNews => 'Nachrichten';

  @override
  String get genreReality => 'Reality';

  @override
  String get genreSciFiFantasy => 'Science-Fiction & Fantasy';

  @override
  String get genreSoap => 'Soap';

  @override
  String get genreTalk => 'Talk';

  @override
  String get genreWarPolitics => 'Krieg & Politik';

  @override
  String get parts => 'Teile';

  @override
  String get seeAll => 'Alle anzeigen';

  @override
  String get sortBy => 'Sortieren nach';

  @override
  String get sortPopularityDesc => 'Am beliebtesten';

  @override
  String get sortPopularityAsc => 'Am wenigsten beliebt';

  @override
  String get sortRatingDesc => 'Bestbewertet';

  @override
  String get sortRatingAsc => 'Am niedrigsten bewertet';

  @override
  String get sortReleaseDateDesc => 'Neueste';

  @override
  String get sortReleaseDateAsc => 'Älteste';

  @override
  String get sortRevenueDesc => 'Höchste Einnahmen';

  @override
  String get sortRevenueAsc => 'Niedrigste Einnahmen';

  @override
  String get sortVoteCountDesc => 'Meiste Stimmen';

  @override
  String get sortVoteCountAsc => 'Wenigste Stimmen';

  @override
  String get sortFirstAirDateDesc => 'Neueste';

  @override
  String get sortFirstAirDateAsc => 'Älteste';

  @override
  String get sortVoteAverageDesc => 'Bestbewertet';

  @override
  String get sortVoteAverageAsc => 'Am niedrigsten bewertet';

  @override
  String get home => 'Startseite';

  @override
  String get applyFilters => 'Anwenden';

  @override
  String get clearFilters => 'Zurücksetzen';

  @override
  String get collections => 'Sammlungen';

  @override
  String get cartoons => 'Zeichentrick';

  @override
  String get anime => 'Anime';

  @override
  String get maifa => 'Mafia';

  @override
  String get marvel => 'Marvel';

  @override
  String get year => 'Jahr';

  @override
  String get rating => 'Bewertung';

  @override
  String get min => 'Min.';

  @override
  String get cartoonDescreption =>
      'Bunter Spaß, entspanntes Lachen und fröhliche Stimmung';

  @override
  String get mafiaDescreption =>
      'Macht, Loyalität und Verrat – Geschichten aus der Unterwelt.';

  @override
  String get animeDescreption =>
      'Epische Welten, tiefe Emotionen und unvergessliche Kämpfe.';

  @override
  String get marvelDescreption =>
      'Helden, Schurken und der Wahnsinn des Multiversums – alles an einem Ort.';

  @override
  String get logoutSuccessfully => 'Erfolgreich abgemeldet';

  @override
  String get backOnline => 'Wieder online';

  @override
  String durationFormat(int hours, int minutes) {
    return '${hours}Std ${minutes}Min';
  }

  @override
  String get duration => 'Dauer';

  @override
  String noFavoritesContentType(String type) {
    return 'Keine $type in den Favoriten';
  }

  @override
  String get statusReleased => 'Veröffentlicht';

  @override
  String get statusEnded => 'Beendet';

  @override
  String get statusReturningSeries => 'Läuft derzeit';

  @override
  String get statusInProduction => 'In Produktion';

  @override
  String get statusCanceled => 'Abgesetzt';

  @override
  String get statusUnknown => 'Unbekannt';

  @override
  String numberFormat(int number) {
    final intl.NumberFormat numberNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
      decimalDigits: 0,
      symbol: '\$',
    );
    final String numberString = numberNumberFormat.format(number);

    return '$numberString';
  }

  @override
  String get onboardingTitle1 => 'Entdecke deine nächste Leidenschaft';

  @override
  String get onboardingDesc1 =>
      'Entdecke angesagte Filme und sehenswerte Serien in Sekunden.';

  @override
  String get onboardingTitle2 => 'Bewahre deine Favoriten griffbereit';

  @override
  String get onboardingDesc2 =>
      'Speichere Filme und Serien, die du liebst, in deiner Watchlist.';

  @override
  String get onboardingTitle3 => 'Erst ansehen, dann entscheiden';

  @override
  String get onboardingDesc3 =>
      'Sieh dir Trailer, Bewertungen und Rezensionen an, bevor du mit dem Anschauen beginnst.';

  @override
  String get onboardingTitle0 =>
      'Deine nächste filmische Leidenschaft beginnt hier';

  @override
  String get loginSuccessfully => 'Erfolgreich angemeldet';

  @override
  String get loginFailed => 'Anmeldung fehlgeschlagen';

  @override
  String get loginTagline =>
      'Melde dich an, um deine Favoritenliste zu behalten';

  @override
  String get signWithGoogle => 'Mit Google anmelden';

  @override
  String get noResultsFound => 'Keine Ergebnisse gefunden';

  @override
  String get somethingWentWrong => 'Etwas ist schiefgelaufen';

  @override
  String get removeFromFavorites => 'Aus Favoriten entfernen';

  @override
  String get share => 'Teilen';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get guestStars => 'Gaststars';

  @override
  String get lastEpisode => 'Letzte Folge';

  @override
  String get nextEpisode => 'Nächste Folge';

  @override
  String get firstAirDate => 'Erste Ausstrahlung';

  @override
  String get lastAirDate => 'Letzte Ausstrahlung';

  @override
  String get totalTime => 'Gesamtzeit';

  @override
  String get noHistoryFound => 'Kein Verlauf gefunden';

  @override
  String get noActors => 'Keine Schauspieler';

  @override
  String get noEpisodes => 'Keine Folgen';

  @override
  String get noSeasons => 'Keine Staffeln';

  @override
  String get episode => 'Folge';

  @override
  String get pushNotifications => 'Benachrichtigungen aktivieren';

  @override
  String get getStarted => 'Loslegen';

  @override
  String get startExplore => 'Erkundung starten';

  @override
  String get continueButton => 'Weiter';

  @override
  String get deleteAccount => 'Konto löschen';

  @override
  String get areYouSureYouWantToDelete => 'Konto löschen?';

  @override
  String get thisActionCannotBeUndone => 'Alle deine Favoriten gehen verloren';

  @override
  String get loginAgainToContinue =>
      'Bitte melde dich erneut an, um fortzufahren';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get accountDeleted => 'Konto erfolgreich gelöscht';

  @override
  String get delete => 'Löschen';

  @override
  String get privacySettings => 'Datenschutzeinstellungen';

  @override
  String get byContinue => 'Indem du fortfährst, stimmst du den ';

  @override
  String get terms => 'Nutzungsbedingungen';

  @override
  String get and => 'und';

  @override
  String get privacyPolicy => 'der Datenschutzrichtlinie zu';

  @override
  String get lightOut => 'Aufhellen';

  @override
  String get dim => 'Abdunkeln';
}
