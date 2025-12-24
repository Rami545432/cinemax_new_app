import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('tr'),
  ];

  /// Welcome message shown to the user after login
  ///
  /// In en, this message translates to:
  /// **'Welcome, {username} !'**
  String welcomeUser(String username);

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get authLogin;

  /// Button to create a new account
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get authRegister;

  /// Email input field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmail;

  /// Password input field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// Link to reset the password
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// Button to confirm password reset
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get authResetPassword;

  /// Message shown when password reset succeeds
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully'**
  String get authResetPasswordSuccess;

  /// Error message shown when password reset fails
  ///
  /// In en, this message translates to:
  /// **'Failed to reset password'**
  String get authResetPasswordError;

  /// Text for other sign-in options
  ///
  /// In en, this message translates to:
  /// **'Or sign in with'**
  String get authSignInWith;

  /// Logout button text
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get authLogout;

  /// Section for popular movies or TV shows
  ///
  /// In en, this message translates to:
  /// **'POPULAR'**
  String get popular;

  /// Section for currently playing movies or shows
  ///
  /// In en, this message translates to:
  /// **'NOW PLAYING'**
  String get nowPlaying;

  /// Section for top-rated content
  ///
  /// In en, this message translates to:
  /// **'TOP RATED'**
  String get topRated;

  /// Section for upcoming movies or shows
  ///
  /// In en, this message translates to:
  /// **'UPCOMING'**
  String get upcoming;

  /// Section for trending content
  ///
  /// In en, this message translates to:
  /// **'TRENDING'**
  String get trending;

  /// Search button or title
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Hint text inside the search field
  ///
  /// In en, this message translates to:
  /// **'Search for a movie or TV show...'**
  String get searchHint;

  /// Title for previous search history
  ///
  /// In en, this message translates to:
  /// **'Search History'**
  String get searchHistory;

  /// Button to clear search history
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistory;

  /// About page title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// List of cast members
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get cast;

  /// Section for similar or suggested content
  ///
  /// In en, this message translates to:
  /// **'Similar'**
  String get similar;

  /// Section for recommended content
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// Section showing user reviews
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// Number of seasons in a series
  ///
  /// In en, this message translates to:
  /// **'Seasons'**
  String get seasons;

  /// Number of episodes in a season
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get episodes;

  /// Broadcast or production network
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// Company that produced the content
  ///
  /// In en, this message translates to:
  /// **'Production Company'**
  String get productionCompany;

  /// Categories of movies
  ///
  /// In en, this message translates to:
  /// **'Movie Genres'**
  String get movieGenres;

  /// Categories of TV shows
  ///
  /// In en, this message translates to:
  /// **'TV Genres'**
  String get tvGenres;

  /// Generic label meaning all items
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Section for movies
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get movies;

  /// Section for TV shows
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get tvShows;

  /// Original title of the content
  ///
  /// In en, this message translates to:
  /// **'Original Title'**
  String get originalTitle;

  /// Release date of the content
  ///
  /// In en, this message translates to:
  /// **'Release Date'**
  String get releaseDate;

  /// Duration of the movie or episode
  ///
  /// In en, this message translates to:
  /// **'Runtime'**
  String get runtime;

  /// Status of the content (ongoing, completed, etc.)
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Language of the content
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Production budget
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// Earnings or revenue of the content
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// Summary of the content
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// Main plot of the content
  ///
  /// In en, this message translates to:
  /// **'Storyline'**
  String get storyLine;

  /// Text shown when no description exists
  ///
  /// In en, this message translates to:
  /// **'No description available'**
  String get noDescriptionAvailable;

  /// Button to show less text
  ///
  /// In en, this message translates to:
  /// **'Less'**
  String get less;

  /// Button to show more text
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// Geners of the content
  ///
  /// In en, this message translates to:
  /// **'Geners'**
  String get geners;

  /// Countries of the content
  ///
  /// In en, this message translates to:
  /// **'Countries'**
  String get countries;

  /// Informations of the content
  ///
  /// In en, this message translates to:
  /// **'Informations'**
  String get informations;

  /// Trailers of the content
  ///
  /// In en, this message translates to:
  /// **'Trailers'**
  String get trailers;

  /// Profile page title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Theme of the app
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// System of the app
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// Light mode of the app
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// Dark mode of the app
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// Favorites of the app
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// My profile of the app
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// Text shown when no items are found
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get noItemsFound;

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Text shown when no internet connection is found
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;

  /// Text shown when no {type} in favorites is found
  ///
  /// In en, this message translates to:
  /// **'No {type} in favorites'**
  String nofavorites(String type);

  /// Text shown when no {type} in favorites is found
  ///
  /// In en, this message translates to:
  /// **'Start adding your favorite {type}'**
  String startAddingYourFavorite(String type);

  /// Text shown when no trailers are found
  ///
  /// In en, this message translates to:
  /// **'No trailers available'**
  String get noTrailersAvailable;

  /// Text shown when no seasons are found
  ///
  /// In en, this message translates to:
  /// **'No seasons available'**
  String get noSeasonsAvailable;

  /// Text shown when no episodes are found
  ///
  /// In en, this message translates to:
  /// **'No episodes available'**
  String get noEpisodesAvailable;

  /// Text shown when no reviews are found
  ///
  /// In en, this message translates to:
  /// **'No reviews available'**
  String get noReviewsAvailable;

  /// Text shown when no sign in is found
  ///
  /// In en, this message translates to:
  /// **'Log In To Synchornize Your Favorite Movies And Tv Shows And To Use More Features'**
  String get signInHint;

  /// Text shown when no airing today is found
  ///
  /// In en, this message translates to:
  /// **'AIRING TODAY'**
  String get airingToday;

  /// Text shown when no discover is found
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @genreAction.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get genreAction;

  /// No description provided for @genreAdventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get genreAdventure;

  /// No description provided for @genreAnimation.
  ///
  /// In en, this message translates to:
  /// **'Animation'**
  String get genreAnimation;

  /// No description provided for @genreComedy.
  ///
  /// In en, this message translates to:
  /// **'Comedy'**
  String get genreComedy;

  /// No description provided for @genreCrime.
  ///
  /// In en, this message translates to:
  /// **'Crime'**
  String get genreCrime;

  /// No description provided for @genreDocumentary.
  ///
  /// In en, this message translates to:
  /// **'Documentary'**
  String get genreDocumentary;

  /// No description provided for @genreDrama.
  ///
  /// In en, this message translates to:
  /// **'Drama'**
  String get genreDrama;

  /// No description provided for @genreFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get genreFamily;

  /// No description provided for @genreFantasy.
  ///
  /// In en, this message translates to:
  /// **'Fantasy'**
  String get genreFantasy;

  /// No description provided for @genreHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get genreHistory;

  /// No description provided for @genreHorror.
  ///
  /// In en, this message translates to:
  /// **'Horror'**
  String get genreHorror;

  /// No description provided for @genreMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get genreMusic;

  /// No description provided for @genreMystery.
  ///
  /// In en, this message translates to:
  /// **'Mystery'**
  String get genreMystery;

  /// No description provided for @genreRomance.
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get genreRomance;

  /// No description provided for @genreSciFi.
  ///
  /// In en, this message translates to:
  /// **'Science Fiction'**
  String get genreSciFi;

  /// No description provided for @genreTvMovie.
  ///
  /// In en, this message translates to:
  /// **'TV Movie'**
  String get genreTvMovie;

  /// No description provided for @genreThriller.
  ///
  /// In en, this message translates to:
  /// **'Thriller'**
  String get genreThriller;

  /// No description provided for @genreWar.
  ///
  /// In en, this message translates to:
  /// **'War'**
  String get genreWar;

  /// No description provided for @genreWestern.
  ///
  /// In en, this message translates to:
  /// **'Western'**
  String get genreWestern;

  /// No description provided for @genreActionAdventure.
  ///
  /// In en, this message translates to:
  /// **'Action & Adventure'**
  String get genreActionAdventure;

  /// No description provided for @genreKids.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get genreKids;

  /// No description provided for @genreNews.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get genreNews;

  /// No description provided for @genreReality.
  ///
  /// In en, this message translates to:
  /// **'Reality'**
  String get genreReality;

  /// No description provided for @genreSciFiFantasy.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi & Fantasy'**
  String get genreSciFiFantasy;

  /// No description provided for @genreSoap.
  ///
  /// In en, this message translates to:
  /// **'Soap'**
  String get genreSoap;

  /// No description provided for @genreTalk.
  ///
  /// In en, this message translates to:
  /// **'Talk'**
  String get genreTalk;

  /// No description provided for @genreWarPolitics.
  ///
  /// In en, this message translates to:
  /// **'War & Politics'**
  String get genreWarPolitics;

  /// Parts of the content
  ///
  /// In en, this message translates to:
  /// **'Parts'**
  String get parts;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'es', 'fr', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
