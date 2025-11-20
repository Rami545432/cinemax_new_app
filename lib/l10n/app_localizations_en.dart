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
  String get popular => 'Popular';

  @override
  String get nowPlaying => 'Now Playing';

  @override
  String get topRated => 'Top Rated';

  @override
  String get upcoming => 'Upcoming';

  @override
  String get trending => 'Trending';

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
  String get tvShows => 'TV Shows';

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
}
