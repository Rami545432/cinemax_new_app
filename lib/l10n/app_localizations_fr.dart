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
}
