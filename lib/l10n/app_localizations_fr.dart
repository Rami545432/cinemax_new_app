// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String welcomeUser(String username) {
    return 'Bienvenue, $username !';
  }

  @override
  String get authLogin => 'Connexion';

  @override
  String get authRegister => 'S\'inscrire';

  @override
  String get authEmail => 'E-mail';

  @override
  String get authPassword => 'Mot de passe';

  @override
  String get authForgotPassword => 'Mot de passe oublié ?';

  @override
  String get authResetPassword => 'Réinitialiser le mot de passe';

  @override
  String get authResetPasswordSuccess =>
      'Mot de passe réinitialisé avec succès';

  @override
  String get authResetPasswordError =>
      'Échec de la réinitialisation du mot de passe';

  @override
  String get authSignInWith => 'Ou se connecter avec';

  @override
  String get authLogout => 'Déconnexion';

  @override
  String get popular => 'POPULAIRE';

  @override
  String get nowPlaying => 'EN COURS';

  @override
  String get topRated => 'LES MIEUX NOTÉS';

  @override
  String get upcoming => 'À VENIR';

  @override
  String get trending => 'TRENDING';

  @override
  String get search => 'Rechercher';

  @override
  String get searchHint => 'Rechercher un film ou une série...';

  @override
  String get searchHistory => 'Historique de recherche';

  @override
  String get clearHistory => 'Effacer l\'historique';

  @override
  String get about => 'À propos';

  @override
  String get cast => 'Distribution';

  @override
  String get similar => 'Similaire';

  @override
  String get recommended => 'Recommandé';

  @override
  String get reviews => 'Avis';

  @override
  String get seasons => 'Saisons';

  @override
  String get episodes => 'Épisodes';

  @override
  String get network => 'Réseau';

  @override
  String get productionCompany => 'Société de production';

  @override
  String get movieGenres => 'Genres de films';

  @override
  String get tvGenres => 'Genres de séries';

  @override
  String get all => 'Tout';

  @override
  String get movies => 'Films';

  @override
  String get tvShows => 'Séries TV';

  @override
  String get originalTitle => 'Titre original';

  @override
  String get releaseDate => 'Date de sortie';

  @override
  String get runtime => 'Durée';

  @override
  String get status => 'Statut';

  @override
  String get language => 'Langue';

  @override
  String get budget => 'Budget';

  @override
  String get revenue => 'Revenus';

  @override
  String get overview => 'Résumé';

  @override
  String get storyLine => 'Synopsis';

  @override
  String get noDescriptionAvailable => 'Aucune description disponible';

  @override
  String get less => 'Moins';

  @override
  String get more => 'Plus';

  @override
  String get geners => 'Genres';

  @override
  String get countries => 'Pays';

  @override
  String get informations => 'Informations';

  @override
  String get trailers => 'Trailers';

  @override
  String get profile => 'Profil';

  @override
  String get theme => 'Thème';

  @override
  String get system => 'Mode système';

  @override
  String get light => 'Mode clair';

  @override
  String get dark => 'Mode sombre';

  @override
  String get favorites => 'Favoris';

  @override
  String get myProfile => 'Mon profil';

  @override
  String get noItemsFound => 'Aucun élément disponible';

  @override
  String get retry => 'Réessayer';

  @override
  String get noInternetConnection => 'Aucune connexion internet';

  @override
  String nofavorites(String type) {
    return 'Aucun $type dans les favoris';
  }

  @override
  String startAddingYourFavorite(String type) {
    return 'Commencez à ajouter votre $type favori';
  }

  @override
  String get noTrailersAvailable => 'Aucun trailer disponible';

  @override
  String get noSeasonsAvailable => 'Aucune saison disponible';

  @override
  String get noEpisodesAvailable => 'Aucun épisode disponible';

  @override
  String get noReviewsAvailable => 'Aucune review disponible';

  @override
  String get signInHint =>
      'Connectez-vous pour synchroniser vos films et séries favorites et utiliser plus de fonctionnalités';

  @override
  String get airingToday => 'En cours de diffusion aujourd\'hui';

  @override
  String get discover => 'Découvrir';

  @override
  String get genreAction => 'Action';

  @override
  String get genreAdventure => 'Aventure';

  @override
  String get genreAnimation => 'Animation';

  @override
  String get genreComedy => 'Comédie';

  @override
  String get genreCrime => 'Criminalité';

  @override
  String get genreDocumentary => 'Documentaire';

  @override
  String get genreDrama => 'Drama';

  @override
  String get genreFamily => 'Famille';

  @override
  String get genreFantasy => 'Fantasy';

  @override
  String get genreHistory => 'Histoire';

  @override
  String get genreHorror => 'Horreur';

  @override
  String get genreMusic => 'Musique';

  @override
  String get genreMystery => 'Mystère';

  @override
  String get genreRomance => 'Romantique';

  @override
  String get genreSciFi => 'Science-fiction';

  @override
  String get genreTvMovie => 'Film de télévision';

  @override
  String get genreThriller => 'Suspense';

  @override
  String get genreWar => 'Guerre';

  @override
  String get genreWestern => 'Western';

  @override
  String get genreActionAdventure => 'Action et Aventure';

  @override
  String get genreKids => 'Enfants';

  @override
  String get genreNews => 'Actualités';

  @override
  String get genreReality => 'Réalité';

  @override
  String get genreSciFiFantasy => 'Science-fiction et Fantastique';

  @override
  String get genreSoap => 'Soap Opera';

  @override
  String get genreTalk => 'Conversation';

  @override
  String get genreWarPolitics => 'Guerre et Politique';

  @override
  String get parts => 'Parts';

  @override
  String get seeAll => 'Voir tout';

  @override
  String get sortBy => 'Trier par';

  @override
  String get sortPopularityDesc => 'Le plus populaire';

  @override
  String get sortPopularityAsc => 'Le moins populaire';

  @override
  String get sortRatingDesc => 'Le mieux noté';

  @override
  String get sortRatingAsc => 'Le moins bien noté';

  @override
  String get sortReleaseDateDesc => 'Le plus récent';

  @override
  String get sortReleaseDateAsc => 'Le plus ancien';

  @override
  String get sortRevenueDesc => 'Le plus rentable';

  @override
  String get sortRevenueAsc => 'Le moins rentable';

  @override
  String get sortVoteCountDesc => 'Le plus voté';

  @override
  String get sortVoteCountAsc => 'Le moins voté';

  @override
  String get sortFirstAirDateDesc => 'Le plus récent';

  @override
  String get sortFirstAirDateAsc => 'Le plus ancien';

  @override
  String get sortVoteAverageDesc => 'Le mieux noté';

  @override
  String get sortVoteAverageAsc => 'Le moins bien noté';

  @override
  String get home => 'Accueil';

  @override
  String get applyFilters => 'Appliquer';

  @override
  String get clearFilters => 'Effacer';

  @override
  String get collections => 'Collections';

  @override
  String get cartoons => 'Dessins animés';

  @override
  String get anime => 'Anime';

  @override
  String get maifa => 'Mafia';

  @override
  String get marvel => 'Marvel';

  @override
  String get year => 'Année';

  @override
  String get rating => 'Note';

  @override
  String get min => 'min';

  @override
  String get cartoonDescreption =>
      'Des rires colorés et des moments chaleureux';

  @override
  String get mafiaDescreption =>
      'Pouvoir, loyauté, trahison - les histoires du monde souterrain.';

  @override
  String get animeDescreption =>
      'Des mondes épiques, des émotions profondes et des batailles inoubliables.';

  @override
  String get marvelDescreption =>
      'Héros, méchants et folie multiverselle - tout en un seul endroit.';

  @override
  String get logoutSuccessfully => 'Déconnexion réussie';

  @override
  String get backOnline => 'Retour en ligne';

  @override
  String durationFormat(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String get duration => 'Durée';

  @override
  String noFavoritesContentType(String type) {
    return 'Aucun $type dans les favoris';
  }

  @override
  String get statusReleased => 'Sorti';

  @override
  String get statusEnded => 'Terminé';

  @override
  String get statusReturningSeries => 'En cours';

  @override
  String get statusInProduction => 'En production';

  @override
  String get statusCanceled => 'Annulé';

  @override
  String get statusUnknown => 'Inconnu';

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
  String get onboardingTitle1 => 'Trouvez Votre Prochaine Obsession';

  @override
  String get onboardingDesc1 =>
      'Découvrez les films tendance et les séries captivantes en quelques secondes.';

  @override
  String get onboardingTitle2 => 'Gardez Vos Favoris Près De Vous';

  @override
  String get onboardingDesc2 =>
      'Enregistrez les films et séries que vous aimez dans votre liste personnelle.';

  @override
  String get onboardingTitle3 => 'Regardez Avant De Choisir';

  @override
  String get onboardingDesc3 =>
      'Consultez les bandes-annonces, notes et avis avant de lancer la lecture.';

  @override
  String get onboardingTitle0 =>
      'Votre prochaine obsession cinématographique commence ici';

  @override
  String get loginSuccessfully => 'Connexion réussie';

  @override
  String get loginFailed => 'Échec de la connexion';

  @override
  String get loginTagline =>
      'Connectez-vous pour conserver votre liste de favoris';

  @override
  String get signWithGoogle => 'Se connecter avec Google';
}
