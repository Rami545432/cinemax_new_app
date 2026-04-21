// lib/core/di/get_it.dart
import 'dart:developer';

import 'package:cinemax_app_new/core/language/presentation/cubits/language_cubit.dart';
import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/network/config/app_dio.dart';
import 'package:cinemax_app_new/core/network/config/network_module.dart';
import 'package:cinemax_app_new/core/network/presentation/cubit/connectivity_cubit.dart';
import 'package:cinemax_app_new/core/theme/cubit/theme_cubit.dart';
import 'package:cinemax_app_new/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:cinemax_app_new/features/auth/data/data_sources/local/auth_local_data_source_impl.dart';
import 'package:cinemax_app_new/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:cinemax_app_new/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:cinemax_app_new/features/auth/data/repos/auth_repo_impl.dart';
import 'package:cinemax_app_new/features/auth/domain/repos/auth_repo.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/login_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/details/data/data_sources/remote/movies/remote_movie_details_data_source.dart';
import 'package:cinemax_app_new/features/details/data/data_sources/remote/movies/remote_movie_details_data_source_impl.dart';
import 'package:cinemax_app_new/features/details/data/data_sources/remote/series/remote_series_details_data_source.dart';
import 'package:cinemax_app_new/features/details/data/data_sources/remote/series/remote_series_details_data_source_impl.dart';
import 'package:cinemax_app_new/features/details/data/repos/movie_details_repo_impl.dart';
import 'package:cinemax_app_new/features/details/data/repos/series_details_repo_impl.dart';
import 'package:cinemax_app_new/features/details/domain/repo/movie_details_repo.dart';
import 'package:cinemax_app_new/features/details/domain/repo/series_details_repo.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/movies/fetch_collections_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/movies/fetch_movie_details_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/movies/fetch_movies_recommendations_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/movies/fetch_similar_movies_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/tv/fetch_series_recommendations_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/tv/fetch_series_season_details.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/tv/fetch_similar_series_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/tv/fetch_tv_show_details_use_case.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_collection_cubit/fetch_collection_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:cinemax_app_new/features/discover/data/data_sources/remote_discover_data_source.dart';
import 'package:cinemax_app_new/features/discover/data/data_sources/remote_discover_data_source_impl.dart';
import 'package:cinemax_app_new/features/discover/data/repos/discover_repo_impl.dart';
import 'package:cinemax_app_new/features/discover/domain/repos/discover_repo.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_movie_by_genre_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_movie_by_keywords_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_series_by_genre_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_series_by_keywords_use_case.dart';
import 'package:cinemax_app_new/features/discover/presentation/cubits/fetch_items_by_keywords_cubit.dart';
import 'package:cinemax_app_new/features/favorite/data/data_sources/local/local_favorite_data_source.dart';
import 'package:cinemax_app_new/features/favorite/data/data_sources/local/local_favorite_data_source_impl.dart';
import 'package:cinemax_app_new/features/favorite/data/data_sources/remote/remote_favorite_data_source.dart';
import 'package:cinemax_app_new/features/favorite/data/data_sources/remote/remote_favorite_data_source_impl.dart';
import 'package:cinemax_app_new/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:cinemax_app_new/features/favorite/domain/repos/favorite_repo.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/add_favorite_use_case.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/get_favorite_use_case.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/merge_guest_favorites_use_case.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/pull_cloud_favorites_use_case.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/remove_favorite_use_case.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:cinemax_app_new/features/home/data/data_sources/remote/remote_home_data_source.dart';
import 'package:cinemax_app_new/features/home/data/data_sources/remote/remote_home_data_source_impl.dart';
import 'package:cinemax_app_new/features/home/data/repos/home_repo_impl.dart';
import 'package:cinemax_app_new/features/home/domian/repos/home_repo.dart';
import 'package:cinemax_app_new/features/home/domian/use_cases/get_movies_use_case.dart';
import 'package:cinemax_app_new/features/home/domian/use_cases/get_series_use_case.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/movie_bloc.dart';
import 'package:cinemax_app_new/features/home/presentation/blocs/series_bloc.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/local/local_search_history_data_source.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/local/local_search_history_data_source_impl.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/remote/remote_search_data_source.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/remote/remote_search_data_source_impl.dart';
import 'package:cinemax_app_new/features/search/data/repos/search_history_repo_impl.dart';
import 'package:cinemax_app_new/features/search/data/repos/search_repo_impl.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_history.dart';
import 'package:cinemax_app_new/features/search/domain/repo/search_repo.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/add_to_history_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/clear_search_history_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/delete_from_search_history_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/get_search_history_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/search_movie_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_cases/search_tv_show_use_case.dart';
import 'package:cinemax_app_new/features/search/presentation/blocs/search_bloc.dart';
import 'package:cinemax_app_new/features/search/presentation/cubits/search_history_cubit.dart';
import 'package:cinemax_app_new/features/settings/data/data_sources/local/settings_local_data_source.dart';
import 'package:cinemax_app_new/features/settings/data/data_sources/local/settings_local_data_source_impl.dart';
import 'package:cinemax_app_new/features/settings/data/repos/settings_repo_impl.dart';
import 'package:cinemax_app_new/features/settings/domain/repos/settings_repo.dart';
import 'package:cinemax_app_new/features/settings/domain/use_cases/get_is_first_time_use_case.dart';
import 'package:cinemax_app_new/features/settings/domain/use_cases/set_is_first_time_use_case.dart';
import 'package:cinemax_app_new/features/settings/presentation/cubits/settings_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  // 7) Session & Auth Cubits
  _registerAuthCubit();

  // 8) Settings
  _registerSettings();

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

  if (!getIt.isRegistered<LanguageCubit>()) {
    // If your LocaleCubit still constructs its own SharedPreferences internally,
    // change this to: () => LocaleCubit()
    getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  }

  // Dio
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton<Dio>(() => NetworkModule.provideDio());
  }

  // ApiService using languageProvider (no snapshot of language)
  if (!getIt.isRegistered<ApiService>()) {
    getIt.registerLazySingleton<ApiService>(
      () => ApiService(
        dio: getIt<Dio>(),
        language: getIt<LanguageCubit>().state.locale.languageCode,
      ),
    );
  }

  if (!getIt.isRegistered<FirebaseFirestore>()) {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
  }

  // AppDio – uses ConnectivityCubit
  AppDio.initialize(connectivityCubit: getIt<ConnectivityCubit>());
}

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
  getIt.registerLazySingleton<RemoteMovieDetailsDataSource>(
    () => RemoteMovieDetailsDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<RemoteSeriesDetailsDataSource>(
    () => RemoteSeriesDetailsDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<DiscoverRemoteDataSource>(
    () => DiscoverRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  // // Local - Register as abstract types
  getIt.registerLazySingleton<LocalSearchHistoryDataSource>(
    () => LocalSearchDataSourceImpl(),
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
    ),
  );
  getIt.registerLazySingleton<LocalFavoriteDataSource>(
    () => LocalFavoriteDataSourceImpl(),
  );
  getIt.registerLazySingleton<RemoteFavoriteDataSource>(
    () => RemoteFavoriteDataSourceImpl(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );
}

/// Repositories
void _registerRepositories() {
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(remoteHomeDataSource: getIt<RemoteHomeDataSource>()),
  );

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(remoteDataSource: getIt<RemoteSearchDataSource>()),
  );
  getIt.registerLazySingleton<SearchHistoryRepo>(
    () => SearchHistoryRepoImpl(
      localSearchDataSource: getIt<LocalSearchHistoryDataSource>(),
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
  getIt.registerLazySingleton<FavoriteRepo>(
    () => FavoritesRepositoryImpl(
      remoteDataSource: getIt<RemoteFavoriteDataSource>(),
      localDataSource: getIt<LocalFavoriteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<MovieDetailsRepo>(
    () => MovieDetailsRepoImpl(
      remoteDataSource: getIt<RemoteMovieDetailsDataSource>(),
    ),
  );
  getIt.registerLazySingleton<SeriesDetailsRepo>(
    () => SeriesDetailsRepoImpl(
      remoteSeriesDetailsDataSource: getIt<RemoteSeriesDetailsDataSource>(),
    ),
  );
  getIt.registerLazySingleton<SettingsRepo>(
    () => SettingsRepoImpl(localDataSource: getIt<SettingsLocalDataSource>()),
  );
}

/// Use cases
void _registerUseCases() {
  _registerAuthUseCases();
  _registerHomeUseCases();
  _registerDetailsUseCases();
  _registerSearchUseCases();
  _registerSearchHistoryUseCases();
  _registerDiscoverUseCases();
  _registerFavoriteUseCases();
}

void _registerAuthUseCases() {
  getIt.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<EnableGuestModeUseCase>(
    () => EnableGuestModeUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<DisableGuestModeUseCase>(
    () => DisableGuestModeUseCase(getIt<AuthRepo>()),
  );
}

void _registerHomeUseCases() {
  getIt.registerLazySingleton<GetMoviesUseCase>(
    () => GetMoviesUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<GetSeriesUseCase>(
    () => GetSeriesUseCase(homeRepo: getIt<HomeRepo>()),
  );
}

void _registerDetailsUseCases() {
  getIt.registerLazySingleton<FetchMovieDetailsUseCase>(
    () => FetchMovieDetailsUseCase(movieDetailsRepo: getIt<MovieDetailsRepo>()),
  );
  getIt.registerLazySingleton<FetchTvShowDetailsUseCase>(
    () => FetchTvShowDetailsUseCase(
      seriesDetailsRepo: getIt<SeriesDetailsRepo>(),
    ),
  );
  getIt.registerLazySingleton<FetchMoviesRecommendationsUseCase>(
    () => FetchMoviesRecommendationsUseCase(
      movieDetailsRepo: getIt<MovieDetailsRepo>(),
    ),
  );
  getIt.registerLazySingleton<FetchSeriesRecommendationsUseCase>(
    () => FetchSeriesRecommendationsUseCase(
      seriesDetailsRepo: getIt<SeriesDetailsRepo>(),
    ),
  );
  getIt.registerLazySingleton<FetchSimilarMoviesUseCase>(
    () =>
        FetchSimilarMoviesUseCase(movieDetailsRepo: getIt<MovieDetailsRepo>()),
  );
  getIt.registerLazySingleton<FetchSimilarSeriesUseCase>(
    () => FetchSimilarSeriesUseCase(
      seriesDetailsRepo: getIt<SeriesDetailsRepo>(),
    ),
  );
  getIt.registerLazySingleton<FetchSeriesSeasonDetailsUseCase>(
    () => FetchSeriesSeasonDetailsUseCase(
      seriesDetailsRepo: getIt<SeriesDetailsRepo>(),
    ),
  );
  getIt.registerLazySingleton<FetchCollectionsUseCase>(
    () => FetchCollectionsUseCase(movieDetailsRepo: getIt<MovieDetailsRepo>()),
  );
}

// void _registerSeriesUseCases() {
//   getIt.registerLazySingleton<FetchTrendingTvShowUseCase>(
//     () => FetchTrendingTvShowUseCase(homeRepo: getIt<HomeRepo>()),
//   );
//   getIt.registerLazySingleton<FetchPopularTvShowsUseCase>(
//     () => FetchPopularTvShowsUseCase(homeRepo: getIt<HomeRepo>()),
//   );
//   getIt.registerLazySingleton<FetchTopRatedTvShowsUseCase>(
//     () => FetchTopRatedTvShowsUseCase(homeRepo: getIt<HomeRepo>()),
//   );
//   getIt.registerLazySingleton<FetchAiringTodayTvShowsUseCase>(
//     () => FetchAiringTodayTvShowsUseCase(homeRepo: getIt<HomeRepo>()),
//   );
// }

void _registerSearchUseCases() {
  getIt.registerLazySingleton<SearchMovieUseCase>(
    () => SearchMovieUseCase(searchRepo: getIt<SearchRepo>()),
  );
  getIt.registerLazySingleton<SearchSeriesUseCase>(
    () => SearchSeriesUseCase(searchRepo: getIt<SearchRepo>()),
  );
}

void _registerSearchHistoryUseCases() {
  getIt.registerLazySingleton<GetSearchHistoryUseCase>(
    () =>
        GetSearchHistoryUseCase(searchHistoryRepo: getIt<SearchHistoryRepo>()),
  );
  getIt.registerLazySingleton<AddSearchHistoryUseCase>(
    () =>
        AddSearchHistoryUseCase(searchHistoryRepo: getIt<SearchHistoryRepo>()),
  );
  getIt.registerLazySingleton<DeleteSearchHistoryUseCase>(
    () => DeleteSearchHistoryUseCase(
      searchHistoryRepo: getIt<SearchHistoryRepo>(),
    ),
  );
  getIt.registerLazySingleton<ClearSearchHistoryUseCase>(
    () => ClearSearchHistoryUseCase(
      searchHistoryRepo: getIt<SearchHistoryRepo>(),
    ),
  );
}

void _registerDiscoverUseCases() {
  getIt.registerLazySingleton<FetchMoviesByGenreUseCase>(
    () => FetchMoviesByGenreUseCase(getIt<DiscoverRepo>()),
  );
  getIt.registerLazySingleton<FetchSeriesByGenreUseCase>(
    () => FetchSeriesByGenreUseCase(getIt<DiscoverRepo>()),
  );
  getIt.registerLazySingleton<FetchMoviesByKeywordsUseCase>(
    () => FetchMoviesByKeywordsUseCase(repo: getIt<DiscoverRepo>()),
  );
  getIt.registerLazySingleton<FetchSeriesByKeywordsUseCase>(
    () => FetchSeriesByKeywordsUseCase(repo: getIt<DiscoverRepo>()),
  );
}

void _registerFavoriteUseCases() {
  getIt.registerLazySingleton(() => GetFavoritesUseCase(getIt<FavoriteRepo>()));
  getIt.registerLazySingleton(() => AddFavoriteUseCase(getIt<FavoriteRepo>()));
  getIt.registerLazySingleton(
    () => RemoveFavoriteUseCase(getIt<FavoriteRepo>()),
  );
  getIt.registerLazySingleton(
    () => MergeGuestFavoritesUseCase(getIt<FavoriteRepo>()),
  );
  getIt.registerLazySingleton(
    () => PullCloudFavoritesUseCase(getIt<FavoriteRepo>()),
  );
}

/// Cubits (global + factories)
void _registerCubits() {
  // // ThemeCubit depends on SharedPreferences
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  // Home screen shared cubit
  getIt.registerLazySingleton<MovieBloc>(
    () => MovieBloc(getMoviesUseCase: getIt<GetMoviesUseCase>()),
  );

  // Series screen shared cubit
  getIt.registerLazySingleton<SeriesBloc>(
    () => SeriesBloc(getSeriesUseCase: getIt<GetSeriesUseCase>()),
  );

  //   Factory cubits
  getIt.registerFactory<FetchDetailsCubit>(
    () => FetchDetailsCubit(
      fetchMovieDetailsUseCase: getIt<FetchMovieDetailsUseCase>(),
      fetchTvShowDetailsUseCase: getIt<FetchTvShowDetailsUseCase>(),
    ),
  );

  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(
      searchMovieUseCase: getIt<SearchMovieUseCase>(),
      searchSeriesUseCase: getIt<SearchSeriesUseCase>(),
    ),
  );

  getIt.registerFactory<FetchSeriesSeasonDetailsCubit>(
    () =>
        FetchSeriesSeasonDetailsCubit(getIt<FetchSeriesSeasonDetailsUseCase>()),
  );

  getIt.registerFactory<FetchCollectionCubit>(
    () => FetchCollectionCubit(
      fetchCollectionsUseCase: getIt<FetchCollectionsUseCase>(),
    ),
  );

  getIt.registerLazySingleton<FavoriteCubit>(
    () => FavoriteCubit(
      mergeGuestFavoritesUseCase: getIt<MergeGuestFavoritesUseCase>(),
      pullCloudFavoritesUseCase: getIt<PullCloudFavoritesUseCase>(),
      getFavoritesUseCase: getIt<GetFavoritesUseCase>(),
      addFavoriteUseCase: getIt<AddFavoriteUseCase>(),
      removeFavoriteUseCase: getIt<RemoveFavoriteUseCase>(),
    ),
  );
  getIt.registerFactory<FetchItemsByKeywordsCubit>(
    () => FetchItemsByKeywordsCubit(
      fetchMoviesByKeywordsUseCase: getIt<FetchMoviesByKeywordsUseCase>(),
      fetchSeriesByKeywordsUseCase: getIt<FetchSeriesByKeywordsUseCase>(),
    ),
  );
  getIt.registerFactory<SearchHistoryCubit>(
    () => SearchHistoryCubit(
      getIt<GetSearchHistoryUseCase>(),
      getIt<AddSearchHistoryUseCase>(),
      getIt<DeleteSearchHistoryUseCase>(),
      getIt<ClearSearchHistoryUseCase>(),
    ),
  );
}

/// AuthCubit registration (global
/// – do it after all use cases are registered)
void _registerAuthCubit() {
  getIt.registerLazySingleton<SessionCubit>(
    () => SessionCubit(
      signOutUseCase: getIt<SignOutUseCase>(),
      getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
      enableGuestModeUseCase: getIt<EnableGuestModeUseCase>(),
      disableGuestModeUseCase: getIt<DisableGuestModeUseCase>(),
    ),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>(),
    ),
  );
}

void _registerSettings() {
  getIt.registerLazySingleton<GetIsFirstTimeUseCase>(
    () => GetIsFirstTimeUseCase(getIt<SettingsRepo>()),
  );
  getIt.registerLazySingleton<SetIsFirstTimeUseCase>(
    () => SetIsFirstTimeUseCase(getIt<SettingsRepo>()),
  );
  getIt.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit(
      getIsFirstTimeUseCase: getIt<GetIsFirstTimeUseCase>(),
      setIsFirstTimeUseCase: getIt<SetIsFirstTimeUseCase>(),
    ),
  );
}
