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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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

  /// Button to see all content
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// Button to sort content
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// Sort by most popular
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get sortPopularityDesc;

  /// Sort by least popular
  ///
  /// In en, this message translates to:
  /// **'Least Popular'**
  String get sortPopularityAsc;

  /// Sort by highest rated
  ///
  /// In en, this message translates to:
  /// **'Highest Rated'**
  String get sortRatingDesc;

  /// Sort by lowest rated
  ///
  /// In en, this message translates to:
  /// **'Lowest Rated'**
  String get sortRatingAsc;

  /// Sort by newest
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get sortReleaseDateDesc;

  /// Sort by oldest
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get sortReleaseDateAsc;

  /// Sort by highest revenue
  ///
  /// In en, this message translates to:
  /// **'Highest Revenue'**
  String get sortRevenueDesc;

  /// Sort by lowest revenue
  ///
  /// In en, this message translates to:
  /// **'Lowest Revenue'**
  String get sortRevenueAsc;

  /// Sort by most voted
  ///
  /// In en, this message translates to:
  /// **'Most Voted'**
  String get sortVoteCountDesc;

  /// Sort by least voted
  ///
  /// In en, this message translates to:
  /// **'Least Voted'**
  String get sortVoteCountAsc;

  /// Sort by newest
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get sortFirstAirDateDesc;

  /// Sort by oldest
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get sortFirstAirDateAsc;

  /// Sort by highest rated
  ///
  /// In en, this message translates to:
  /// **'Highest Rated'**
  String get sortVoteAverageDesc;

  /// Sort by lowest rated
  ///
  /// In en, this message translates to:
  /// **'Lowest Rated'**
  String get sortVoteAverageAsc;

  /// Home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Apply Filters
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get applyFilters;

  /// Clear Filters
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearFilters;

  /// Collections
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collections;

  /// Cartoons
  ///
  /// In en, this message translates to:
  /// **'Cartoons'**
  String get cartoons;

  /// Anime
  ///
  /// In en, this message translates to:
  /// **'Anime'**
  String get anime;

  /// Mafia
  ///
  /// In en, this message translates to:
  /// **'Mafia'**
  String get maifa;

  /// Marvel
  ///
  /// In en, this message translates to:
  /// **'Marvel'**
  String get marvel;

  /// Year
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// Rating
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// min
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get min;

  /// Cartoon description
  ///
  /// In en, this message translates to:
  /// **'Colorful fun, cozy laughs, and pure good vibes'**
  String get cartoonDescreption;

  /// Mafia description
  ///
  /// In en, this message translates to:
  /// **'Power, loyalty, betrayal — the underworld stories.'**
  String get mafiaDescreption;

  /// Anime description
  ///
  /// In en, this message translates to:
  /// **'Epic worlds, deep emotions, unforgettable battles.'**
  String get animeDescreption;

  /// Marvel description
  ///
  /// In en, this message translates to:
  /// **'Heroes, villains, and multiverse madness — all in one place.'**
  String get marvelDescreption;

  /// Logout successfully
  ///
  /// In en, this message translates to:
  /// **'Logout successfully'**
  String get logoutSuccessfully;

  /// Back Online
  ///
  /// In en, this message translates to:
  /// **'Back Online'**
  String get backOnline;

  /// No description provided for @durationFormat.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String durationFormat(int hours, int minutes);

  /// Duration
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @noFavoritesContentType.
  ///
  /// In en, this message translates to:
  /// **'No {type} in favorites'**
  String noFavoritesContentType(String type);

  /// No description provided for @statusReleased.
  ///
  /// In en, this message translates to:
  /// **'Released'**
  String get statusReleased;

  /// No description provided for @statusEnded.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get statusEnded;

  /// No description provided for @statusReturningSeries.
  ///
  /// In en, this message translates to:
  /// **'Returning Series'**
  String get statusReturningSeries;

  /// No description provided for @statusInProduction.
  ///
  /// In en, this message translates to:
  /// **'In Production'**
  String get statusInProduction;

  /// No description provided for @statusCanceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get statusCanceled;

  /// No description provided for @statusUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get statusUnknown;

  /// No description provided for @numberFormat.
  ///
  /// In en, this message translates to:
  /// **'{number}'**
  String numberFormat(int number);

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Discover Your Next Obsession'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Find trending movies and must-watch series in seconds.'**
  String get onboardingDesc1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Keep Favorites Close'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Save movies and shows you love into your personal watchlist.'**
  String get onboardingDesc2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Watch Before You Commit'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Check trailers, ratings, and reviews before hitting play.'**
  String get onboardingDesc3;

  /// No description provided for @onboardingTitle0.
  ///
  /// In en, this message translates to:
  /// **'Your Next Cinematic Obsession Starts Here'**
  String get onboardingTitle0;

  /// No description provided for @loginSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Login successfully'**
  String get loginSuccessfully;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @loginTagline.
  ///
  /// In en, this message translates to:
  /// **'Login to keep your favorite list'**
  String get loginTagline;

  /// No description provided for @signWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signWithGoogle;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove From Favorites'**
  String get removeFromFavorites;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @guestStars.
  ///
  /// In en, this message translates to:
  /// **'Guest Stars'**
  String get guestStars;

  /// No description provided for @lastEpisode.
  ///
  /// In en, this message translates to:
  /// **'Last Episode'**
  String get lastEpisode;

  /// No description provided for @nextEpisode.
  ///
  /// In en, this message translates to:
  /// **'Next Episode'**
  String get nextEpisode;

  /// No description provided for @firstAirDate.
  ///
  /// In en, this message translates to:
  /// **'First Air Date'**
  String get firstAirDate;

  /// No description provided for @lastAirDate.
  ///
  /// In en, this message translates to:
  /// **'Last Air Date'**
  String get lastAirDate;

  /// No description provided for @totalTime.
  ///
  /// In en, this message translates to:
  /// **'Total Time'**
  String get totalTime;

  /// No description provided for @noHistoryFound.
  ///
  /// In en, this message translates to:
  /// **'No History Found'**
  String get noHistoryFound;

  /// No description provided for @noActors.
  ///
  /// In en, this message translates to:
  /// **'No Actors'**
  String get noActors;

  /// No description provided for @noEpisodes.
  ///
  /// In en, this message translates to:
  /// **'No Episodes'**
  String get noEpisodes;

  /// No description provided for @noSeasons.
  ///
  /// In en, this message translates to:
  /// **'No Seasons'**
  String get noSeasons;

  /// No description provided for @episode.
  ///
  /// In en, this message translates to:
  /// **'Episode'**
  String get episode;

  /// No description provided for @pushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get pushNotifications;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @startExplore.
  ///
  /// In en, this message translates to:
  /// **'Start Explore'**
  String get startExplore;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @areYouSureYouWantToDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Your Account ?'**
  String get areYouSureYouWantToDelete;

  /// No description provided for @thisActionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'Your Favorites Will Be Deleted Permanently'**
  String get thisActionCannotBeUndone;

  /// No description provided for @loginAgainToContinue.
  ///
  /// In en, this message translates to:
  /// **'Please login again to continue'**
  String get loginAgainToContinue;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @accountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Account deleted successfully'**
  String get accountDeleted;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @privacySettings.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get privacySettings;
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
