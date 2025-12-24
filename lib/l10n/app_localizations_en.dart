// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String welcomeUser(String username) {
    return 'Welcome, $username !';
  }

  @override
  String get authLogin => 'Login';

  @override
  String get authRegister => 'Register';

  @override
  String get authEmail => 'Email';

  @override
  String get authPassword => 'Password';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authResetPassword => 'Reset Password';

  @override
  String get authResetPasswordSuccess => 'Password reset successfully';

  @override
  String get authResetPasswordError => 'Failed to reset password';

  @override
  String get authSignInWith => 'Or sign in with';

  @override
  String get authLogout => 'Log out';

  @override
  String get popular => 'POPULAR';

  @override
  String get nowPlaying => 'NOW PLAYING';

  @override
  String get topRated => 'TOP RATED';

  @override
  String get upcoming => 'UPCOMING';

  @override
  String get trending => 'TRENDING';

  @override
  String get search => 'Search';

  @override
  String get searchHint => 'Search for a movie or TV show...';

  @override
  String get searchHistory => 'Search History';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get about => 'About';

  @override
  String get cast => 'Cast';

  @override
  String get similar => 'Similar';

  @override
  String get recommended => 'Recommended';

  @override
  String get reviews => 'Reviews';

  @override
  String get seasons => 'Seasons';

  @override
  String get episodes => 'Episodes';

  @override
  String get network => 'Network';

  @override
  String get productionCompany => 'Production Company';

  @override
  String get movieGenres => 'Movie Genres';

  @override
  String get tvGenres => 'TV Genres';

  @override
  String get all => 'All';

  @override
  String get movies => 'Movies';

  @override
  String get tvShows => 'Series';

  @override
  String get originalTitle => 'Original Title';

  @override
  String get releaseDate => 'Release Date';

  @override
  String get runtime => 'Runtime';

  @override
  String get status => 'Status';

  @override
  String get language => 'Language';

  @override
  String get budget => 'Budget';

  @override
  String get revenue => 'Revenue';

  @override
  String get overview => 'Overview';

  @override
  String get storyLine => 'Storyline';

  @override
  String get noDescriptionAvailable => 'No description available';

  @override
  String get less => 'Less';

  @override
  String get more => 'More';

  @override
  String get geners => 'Geners';

  @override
  String get countries => 'Countries';

  @override
  String get informations => 'Informations';

  @override
  String get trailers => 'Trailers';

  @override
  String get profile => 'Profile';

  @override
  String get theme => 'Theme';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get favorites => 'Favorites';

  @override
  String get myProfile => 'My Profile';

  @override
  String get noItemsFound => 'No items found';

  @override
  String get retry => 'Retry';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String nofavorites(String type) {
    return 'No $type in favorites';
  }

  @override
  String startAddingYourFavorite(String type) {
    return 'Start adding your favorite $type';
  }

  @override
  String get noTrailersAvailable => 'No trailers available';

  @override
  String get noSeasonsAvailable => 'No seasons available';

  @override
  String get noEpisodesAvailable => 'No episodes available';

  @override
  String get noReviewsAvailable => 'No reviews available';

  @override
  String get signInHint =>
      'Log In To Synchornize Your Favorite Movies And Tv Shows And To Use More Features';

  @override
  String get airingToday => 'AIRING TODAY';

  @override
  String get discover => 'Discover';

  @override
  String get genreAction => 'Action';

  @override
  String get genreAdventure => 'Adventure';

  @override
  String get genreAnimation => 'Animation';

  @override
  String get genreComedy => 'Comedy';

  @override
  String get genreCrime => 'Crime';

  @override
  String get genreDocumentary => 'Documentary';

  @override
  String get genreDrama => 'Drama';

  @override
  String get genreFamily => 'Family';

  @override
  String get genreFantasy => 'Fantasy';

  @override
  String get genreHistory => 'History';

  @override
  String get genreHorror => 'Horror';

  @override
  String get genreMusic => 'Music';

  @override
  String get genreMystery => 'Mystery';

  @override
  String get genreRomance => 'Romance';

  @override
  String get genreSciFi => 'Science Fiction';

  @override
  String get genreTvMovie => 'TV Movie';

  @override
  String get genreThriller => 'Thriller';

  @override
  String get genreWar => 'War';

  @override
  String get genreWestern => 'Western';

  @override
  String get genreActionAdventure => 'Action & Adventure';

  @override
  String get genreKids => 'Kids';

  @override
  String get genreNews => 'News';

  @override
  String get genreReality => 'Reality';

  @override
  String get genreSciFiFantasy => 'Sci-Fi & Fantasy';

  @override
  String get genreSoap => 'Soap';

  @override
  String get genreTalk => 'Talk';

  @override
  String get genreWarPolitics => 'War & Politics';

  @override
  String get parts => 'Parts';
}
