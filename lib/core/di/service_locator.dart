// lib/core/di/get_it.dart
import 'dart:developer';

import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/network/config/app_dio.dart';
import 'package:cinemax_app_new/core/network/config/network_module.dart';
import 'package:cinemax_app_new/core/network/presentation/cubit/connectivity_cubit.dart';
import 'package:cinemax_app_new/core/theme/cubit/theme_cubit.dart';

import 'package:cinemax_app_new/features/auth/data/data_soureces/auth_local_data_source.dart';
import 'package:cinemax_app_new/features/auth/data/data_soureces/auth_remote_data_source.dart';
import 'package:cinemax_app_new/features/auth/data/repos/auth_repo_impl.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/check_auth_statues_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/continue_as_guest_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/is_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_email_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_facebook_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_up_with_email_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';

import 'package:cinemax_app_new/features/details/data/remote_details_data_source/remote_details_data_source.dart';
import 'package:cinemax_app_new/features/details/data/repos/details_repo_impl.dart';
import 'package:cinemax_app_new/features/details/domain/repo/details_repo.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_collections_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_recommended_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_series_season_details.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_similar_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_tv_show_details_use_case.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_collection_cubit/fetch_collection_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_similar_cubit.dart';

import 'package:cinemax_app_new/features/discover/data/data_sourece/discover_remote_data_source.dart';
import 'package:cinemax_app_new/features/discover/data/repos/discover_repo_impl.dart';
import 'package:cinemax_app_new/features/discover/domain/repos/discover_repo.dart';
import 'package:cinemax_app_new/features/discover/domain/use_case/fetch_genre_content_use_case.dart';
import 'package:cinemax_app_new/features/discover/presentation/cubit/genre_content_cubit.dart';
import 'package:cinemax_app_new/features/favorite/data/local_favorite_data_source/local_favorite_data_source.dart';

import 'package:cinemax_app_new/features/favorite/data/local_favorite_data_source/local_favorite_data_source_impl.dart';
import 'package:cinemax_app_new/features/favorite/data/remote_favorite_data_source/remote_favorite_data_source.dart';
import 'package:cinemax_app_new/features/favorite/data/remote_favorite_data_source/remote_favorite_data_source_impl.dart';
import 'package:cinemax_app_new/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:cinemax_app_new/features/favorite/domain/repos/favorite_repo.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/manage_favorites_use_case.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubit/favorite_cubit.dart';

import 'package:cinemax_app_new/features/home/data/data_soureces/remote_home_data_source.dart';
import 'package:cinemax_app_new/features/home/data/repos/home_repo_impl.dart';
import 'package:cinemax_app_new/features/home/domian/repos/home_repo.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_now_playing_movie.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_popular_use_case.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_top_rated_movies.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_trending_movie_use_case.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_upcoming_movies.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_tv_airing_today.use_case.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_tv_popular_use_case.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_tv_top_rated_use_case.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_tv_trending_use_case.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/movie_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/recommended_movies_cubit/recommended_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/series_view_cubit.dart';

import 'package:cinemax_app_new/features/search/data/data_sources/local_search_data_source.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/remote_search_data_source.dart';
import 'package:cinemax_app_new/features/search/data/repos/search_repo_impl.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_repo.dart';
import 'package:cinemax_app_new/features/search/domain/use_case/search_history_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_case/search_movie_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_case/search_tv_show_use_case.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/manger/search_cubit/search_cubit.dart';

import 'package:cinemax_app_new/l10n/local_cubit.dart';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

/// Single entrypoint for all Dependency Injection.
/// Call this once in main() before runApp().
Future<void> setupDependencies() async {
  log('📦 Setting up dependencies...');

  // 1) Core sync services (Dio, Locale, Connectivity, ApiService, AppDio)
  await _registerCoreSync();

  // 2) Async externals (SharedPreferences etc.)
  // _registerAsyncExternal();

  // 3) External non-async deps (FirebaseAuth, GoogleSignIn, FacebookAuth)
  _registerExternalDependencies();

  // 4) Data sources & repositories
  _registerDataSources();
  _registerRepositories();

  // 5) Use cases
  _registerUseCases();

  // 6) Cubits (including Theme, Home/Series/Search/Favorite, etc.)
  _registerCubits();

  // 7) AuthCubit (depends on use cases)
  _registerAuthCubit();

  // 8) Wait for async singletons to be ready (e.g. SharedPreferences)

  log('✅ Dependencies ready');
}

/// Core lightweight sync services
Future<void> _registerCoreSync() async {
  log('⚙️ Registering core sync services');

  // SharedPreferences – get once, register sync
  final sharedPrefs = await SharedPreferences.getInstance();
  if (!getIt.isRegistered<SharedPreferences>()) {
    getIt.registerSingleton<SharedPreferences>(sharedPrefs);
  }

  // Connectivity & Locale
  if (!getIt.isRegistered<ConnectivityCubit>()) {
    getIt.registerLazySingleton<ConnectivityCubit>(() => ConnectivityCubit());
  }

  if (!getIt.isRegistered<LocaleCubit>()) {
    // If your LocaleCubit still constructs its own SharedPreferences internally,
    // change this to: () => LocaleCubit()
    getIt.registerLazySingleton<LocaleCubit>(
      () => LocaleCubit(sharedPreferences: sharedPrefs),
    );
  }

  // Dio
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton<Dio>(() => NetworkModule.provideDio());
  }

  // ApiService using languageProvider (no snapshot of language)
  if (!getIt.isRegistered<ApiService>()) {
    getIt.registerLazySingleton<ApiService>(
      () => ApiService(dio: getIt<Dio>(), language: 'en'),
    );
  }

  // AppDio – uses ConnectivityCubit
  AppDio.initialize(connectivityCubit: getIt<ConnectivityCubit>());
}

/// Async singletons (e.g. SharedPreferences)
// void _registerAsyncExternal() {
//   log('🧩 Registering async externals');

//   if (!getIt.isRegistered<SharedPreferences>()) {
//     getIt.registerSingletonAsync<SharedPreferences>(() async {
//       final sp = await SharedPreferences.getInstance();
//       log('✅ SharedPreferences ready');
//       return sp;
//     });
//   }
// }

/// External deps that are sync to obtain
void _registerExternalDependencies() {
  if (!getIt.isRegistered<FirebaseAuth>()) {
    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  }

  if (!getIt.isRegistered<GoogleSignIn>()) {
    getIt.registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(scopes: ['email', 'profile']),
    );
  }

  if (!getIt.isRegistered<FacebookAuth>()) {
    getIt.registerLazySingleton<FacebookAuth>(() => FacebookAuth.instance);
  }
}

/// Data sources
void _registerDataSources() {
  // Remote - Register as abstract types
  getIt.registerLazySingleton<RemoteHomeDataSource>(
    () => RemoteHomeDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<RemoteSearchDataSource>(
    () => RemoteSearchDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<RemoteDetailsDataSource>(
    () => RemoteDetailsDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<DiscoverRemoteDataSource>(
    () => DiscoverRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  // Local - Register as abstract types
  getIt.registerLazySingleton<LocalSearchDataSource>(
    () => LocalSearchDataSourceImpl(),
  );
  getIt.registerLazySingleton<LocalFavoriteDataSource>(
    () => LocalFavoriteDataSourceImpl(),
  );
  getIt.registerLazySingleton<RemoteFavoriteDataSource>(
    () => RemoteFavoriteDataSourceImpl(),
  );

  // Auth local data source depends on SharedPreferences
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () =>
        AuthLocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()),
  );

  // Auth remote data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
      facebookAuth: getIt<FacebookAuth>(),
    ),
  );
}

/// Repositories
void _registerRepositories() {
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(remoteHomeDataSource: getIt<RemoteHomeDataSource>()),
  );

  getIt.registerLazySingleton<DetailsRepo>(
    () => DetailsRepoImpl(
      remoteDetailsDataSource: getIt<RemoteDetailsDataSource>(),
    ),
  );

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(
      remoteDataSource: getIt<RemoteSearchDataSource>(),
      localSearchDataSource: getIt<LocalSearchDataSource>(),
    ),
  );

  getIt.registerLazySingleton<FavoriteRepo>(
    () => FavoriteRepoImpl(
      remoteDataSource: getIt<RemoteFavoriteDataSource>(),
      localDataSource: getIt<LocalFavoriteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<DiscoverRepo>(
    () => DiscoverRepoImpl(remoteDataSource: getIt<DiscoverRemoteDataSource>()),
  );

  // Auth repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      localDataSource: getIt<AuthLocalDataSource>(),
      remoteDataSource: getIt<AuthRemoteDataSource>(),
    ),
  );
}

/// Use cases
void _registerUseCases() {
  _registerAuthUseCases();
  _registerHomeUseCases();
  _registerDetailsUseCases();
  _registerSeriesUseCases();
  _registerSearchUseCases();
  _registerDiscoverUseCases();
  _registerFavoriteUseCases();
}

void _registerAuthUseCases() {
  getIt.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SignInWithFacebookUseCase>(
    () => SignInWithFacebookUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SignInWithEmailUseCase>(
    () => SignInWithEmailUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SignUpWithEmailUseCase>(
    () => SignUpWithEmailUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<ContinueAsGuestUseCase>(
    () => ContinueAsGuestUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<CheckAuthStatusUseCase>(
    () => CheckAuthStatusUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<EnableGuestModeUseCase>(
    () => EnableGuestModeUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<DisableGuestModeUseCase>(
    () => DisableGuestModeUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<IsGuestModeUseCase>(
    () => IsGuestModeUseCase(getIt<AuthRepo>()),
  );
}

void _registerHomeUseCases() {
  getIt.registerLazySingleton<FetchNowPlayingUseCase>(
    () => FetchNowPlayingUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchTopRatedMoviesUseCase>(
    () => FetchTopRatedMoviesUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchPopularUseCase>(
    () => FetchPopularUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchTrendingMoviesUseCase>(
    () => FetchTrendingMoviesUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchUpcomingMovieCase>(
    () => FetchUpcomingMovieCase(homeRepo: getIt<HomeRepo>()),
  );
}

void _registerDetailsUseCases() {
  getIt.registerLazySingleton<FetchMovieDetailsUseCase>(
    () => FetchMovieDetailsUseCase(detailsRepo: getIt<DetailsRepo>()),
  );
  getIt.registerLazySingleton<FetchTvShowDetailsUseCase>(
    () => FetchTvShowDetailsUseCase(detailsRepo: getIt<DetailsRepo>()),
  );
  getIt.registerLazySingleton<FetchRecommendedUseCase>(
    () => FetchRecommendedUseCase(detailsRepo: getIt<DetailsRepo>()),
  );
  getIt.registerLazySingleton<FetchSimilarUseCase>(
    () => FetchSimilarUseCase(detailsRepo: getIt<DetailsRepo>()),
  );
  getIt.registerLazySingleton<FetchSeriesSeasonDetailsUseCase>(
    () => FetchSeriesSeasonDetailsUseCase(detailsRepo: getIt<DetailsRepo>()),
  );
  getIt.registerLazySingleton<FetchCollectionsUseCase>(
    () => FetchCollectionsUseCase(detailsRepo: getIt<DetailsRepo>()),
  );
}

void _registerSeriesUseCases() {
  getIt.registerLazySingleton<FetchTrendingTvShowUseCase>(
    () => FetchTrendingTvShowUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchPopularTvShowsUseCase>(
    () => FetchPopularTvShowsUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchTopRatedTvShowsUseCase>(
    () => FetchTopRatedTvShowsUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FetchAiringTodayTvShowsUseCase>(
    () => FetchAiringTodayTvShowsUseCase(homeRepo: getIt<HomeRepo>()),
  );
}

void _registerSearchUseCases() {
  getIt.registerLazySingleton<SearchMovieUseCase>(
    () => SearchMovieUseCase(searchRepo: getIt<SearchRepo>()),
  );
  getIt.registerLazySingleton<SearchTvShowUseCase>(
    () => SearchTvShowUseCase(searchRepo: getIt<SearchRepo>()),
  );
  getIt.registerLazySingleton<SearchHistoryUseCase>(
    () => SearchHistoryUseCase(searchRepo: getIt<SearchRepo>()),
  );
}

void _registerDiscoverUseCases() {
  getIt.registerLazySingleton<FetchGenreContentUseCase>(
    () => FetchGenreContentUseCase(getIt<DiscoverRepo>()),
  );
}

void _registerFavoriteUseCases() {
  getIt.registerLazySingleton<ManageFavoritesUseCase>(
    () => ManageFavoritesUseCase(favoriteRepo: getIt<FavoriteRepo>()),
  );
}

/// Cubits (global + factories)
void _registerCubits() {
  // ThemeCubit depends on SharedPreferences
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(getIt<SharedPreferences>()),
  );

  // Home screen shared cubit
  getIt.registerLazySingleton<MovieViewCubit>(
    () => MovieViewCubit(
      fetchTrendingMovieUseCase: getIt<FetchTrendingMoviesUseCase>(),
      fetchPopularUseCase: getIt<FetchPopularUseCase>(),
      fetchUpcomingMovieCase: getIt<FetchUpcomingMovieCase>(),
      fetchNowPlayingUseCase: getIt<FetchNowPlayingUseCase>(),
      fetchTopRatedUseCase: getIt<FetchTopRatedMoviesUseCase>(),
    ),
  );

  // Series screen shared cubit
  getIt.registerLazySingleton<SeriesViewCubit>(
    () => SeriesViewCubit(
      fetchTrendingTvShowUseCase: getIt<FetchTrendingTvShowUseCase>(),
      fetchPopularTvShowsUseCase: getIt<FetchPopularTvShowsUseCase>(),
      fetchTopRatedTvShowsUseCase: getIt<FetchTopRatedTvShowsUseCase>(),
      fetchAiringTodayTvShowsUseCase: getIt<FetchAiringTodayTvShowsUseCase>(),
    ),
  );

  // Factory cubits
  getIt.registerFactory<FetchDetailsCubit>(
    () => FetchDetailsCubit(
      fetchMovieDetailsUseCase: getIt<FetchMovieDetailsUseCase>(),
      fetchTvShowDetailsUseCase: getIt<FetchTvShowDetailsUseCase>(),
    ),
  );

  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(
      getIt<SearchMovieUseCase>(),
      getIt<SearchTvShowUseCase>(),
      getIt<SearchHistoryUseCase>(),
    ),
  );

  getIt.registerFactory<FetchSeriesSeasonDetailsCubit>(
    () =>
        FetchSeriesSeasonDetailsCubit(getIt<FetchSeriesSeasonDetailsUseCase>()),
  );

  getIt.registerFactory<FetchRecommendedCubit>(
    () => FetchRecommendedCubit(getIt<FetchRecommendedUseCase>()),
  );

  getIt.registerFactory<FetchSimilarCubit>(
    () => FetchSimilarCubit(getIt<FetchSimilarUseCase>()),
  );

  getIt.registerLazySingleton<FavoriteCubit>(
    () =>
        FavoriteCubit(manageFavoritesUseCase: getIt<ManageFavoritesUseCase>()),
  );

  getIt.registerFactory<GenreContentCubit>(
    () =>
        GenreContentCubit(fetchGenreUseCase: getIt<FetchGenreContentUseCase>()),
  );
  getIt.registerFactory<FetchCollectionCubit>(
    () => FetchCollectionCubit(
      fetchCollectionsUseCase: getIt<FetchCollectionsUseCase>(),
    ),
  );
}

/// AuthCubit registration (global
/// – do it after all use cases are registered)
void _registerAuthCubit() {
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      authLocalDataSource: getIt<AuthLocalDataSource>(),
      signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
      signInWithFacebookUseCase: getIt<SignInWithFacebookUseCase>(),
      signInWithEmailUseCase: getIt<SignInWithEmailUseCase>(),
      signUpWithEmailUseCase: getIt<SignUpWithEmailUseCase>(),
      signOutUseCase: getIt<SignOutUseCase>(),
      continueAsGuestUseCase: getIt<ContinueAsGuestUseCase>(),
      getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
      resetPasswordUseCase: getIt<ResetPasswordUseCase>(),
      enableGuestModeUseCase: getIt<EnableGuestModeUseCase>(),
      disableGuestModeUseCase: getIt<DisableGuestModeUseCase>(),
      isGuestModeUseCase: getIt<IsGuestModeUseCase>(),
    ),
  );
}
