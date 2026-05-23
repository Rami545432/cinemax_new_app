// lib/core/di/get_it.dart
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movify/core/auth/auth_status_provider.dart';
import 'package:movify/core/language/presentation/cubits/language_cubit.dart';
import 'package:movify/core/network/api/services/api_service.dart';
import 'package:movify/core/network/config/app_dio.dart';
import 'package:movify/core/network/config/network_module.dart';
import 'package:movify/core/network/presentation/cubit/connectivity_cubit.dart';
import 'package:movify/core/routing/app_router.dart';
import 'package:movify/core/theme/cubit/theme_cubit.dart';
import 'package:movify/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:movify/features/auth/data/data_sources/local/auth_local_data_source_impl.dart';
import 'package:movify/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:movify/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:movify/features/auth/data/repos/auth_repo_impl.dart';
import 'package:movify/features/auth/domain/repos/auth_repo.dart';
import 'package:movify/features/auth/domain/use_cases/disable_guest_mode_use_case.dart';
import 'package:movify/features/auth/domain/use_cases/enable_guest_mode_use_case.dart';
import 'package:movify/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:movify/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:movify/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:movify/features/auth/presentation/cubits/login_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/details/data/data_sources/remote/movies/remote_movie_details_data_source.dart';
import 'package:movify/features/details/data/data_sources/remote/movies/remote_movie_details_data_source_impl.dart';
import 'package:movify/features/details/data/data_sources/remote/series/remote_series_details_data_source.dart';
import 'package:movify/features/details/data/data_sources/remote/series/remote_series_details_data_source_impl.dart';
import 'package:movify/features/details/data/repos/movie_details_repo_impl.dart';
import 'package:movify/features/details/data/repos/series_details_repo_impl.dart';
import 'package:movify/features/details/domain/repo/movie_details_repo.dart';
import 'package:movify/features/details/domain/repo/series_details_repo.dart';
import 'package:movify/features/details/domain/use_cases/movies/fetch_collections_use_case.dart';
import 'package:movify/features/details/domain/use_cases/movies/fetch_movie_details_use_case.dart';
import 'package:movify/features/details/domain/use_cases/movies/fetch_movies_recommendations_use_case.dart';
import 'package:movify/features/details/domain/use_cases/movies/fetch_similar_movies_use_case.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_series_recommendations_use_case.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_series_season_details.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_similar_series_use_case.dart';
import 'package:movify/features/details/domain/use_cases/tv/fetch_tv_show_details_use_case.dart';
import 'package:movify/features/details/presentation/cubits/fetch_collection_cubit/fetch_collection_cubit.dart';
import 'package:movify/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:movify/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:movify/features/discover/data/data_sources/remote_discover_data_source.dart';
import 'package:movify/features/discover/data/data_sources/remote_discover_data_source_impl.dart';
import 'package:movify/features/discover/data/repos/discover_repo_impl.dart';
import 'package:movify/features/discover/domain/repos/discover_repo.dart';
import 'package:movify/features/discover/domain/use_cases/fetch_movie_by_genre_use_case.dart';
import 'package:movify/features/discover/domain/use_cases/fetch_movie_by_keywords_use_case.dart';
import 'package:movify/features/discover/domain/use_cases/fetch_series_by_genre_use_case.dart';
import 'package:movify/features/discover/domain/use_cases/fetch_series_by_keywords_use_case.dart';
import 'package:movify/features/discover/presentation/cubits/fetch_items_by_keywords_cubit.dart';
import 'package:movify/features/favorite/data/data_sources/local/local_favorite_data_source.dart';
import 'package:movify/features/favorite/data/data_sources/local/local_favorite_data_source_impl.dart';
import 'package:movify/features/favorite/data/data_sources/remote/remote_favorite_data_source.dart';
import 'package:movify/features/favorite/data/data_sources/remote/remote_favorite_data_source_impl.dart';
import 'package:movify/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:movify/features/favorite/domain/repos/favorite_repo.dart';
import 'package:movify/features/favorite/domain/use_cases/add_favorite_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/get_favorite_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/merge_guest_favorites_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/pull_cloud_favorites_use_case.dart';
import 'package:movify/features/favorite/domain/use_cases/remove_favorite_use_case.dart';
import 'package:movify/features/favorite/presentation/cubits/favorite_cubit.dart';
import 'package:movify/features/home/data/data_sources/remote/remote_home_data_source.dart';
import 'package:movify/features/home/data/data_sources/remote/remote_home_data_source_impl.dart';
import 'package:movify/features/home/data/repos/home_repo_impl.dart';
import 'package:movify/features/home/domian/repos/home_repo.dart';
import 'package:movify/features/home/domian/use_cases/get_movies_use_case.dart';
import 'package:movify/features/home/domian/use_cases/get_series_use_case.dart';
import 'package:movify/features/home/presentation/blocs/movie_bloc.dart';
import 'package:movify/features/home/presentation/blocs/series_bloc.dart';
import 'package:movify/features/search/data/data_sources/local/local_search_history_data_source.dart';
import 'package:movify/features/search/data/data_sources/local/local_search_history_data_source_impl.dart';
import 'package:movify/features/search/data/data_sources/remote/remote_search_data_source.dart';
import 'package:movify/features/search/data/data_sources/remote/remote_search_data_source_impl.dart';
import 'package:movify/features/search/data/repos/search_history_repo_impl.dart';
import 'package:movify/features/search/data/repos/search_repo_impl.dart';
import 'package:movify/features/search/domain/repo/search_history.dart';
import 'package:movify/features/search/domain/repo/search_repo.dart';
import 'package:movify/features/search/domain/use_cases/add_to_history_use_case.dart';
import 'package:movify/features/search/domain/use_cases/clear_search_history_use_case.dart';
import 'package:movify/features/search/domain/use_cases/delete_from_search_history_use_case.dart';
import 'package:movify/features/search/domain/use_cases/get_search_history_use_case.dart';
import 'package:movify/features/search/domain/use_cases/search_movie_use_case.dart';
import 'package:movify/features/search/domain/use_cases/search_tv_show_use_case.dart';
import 'package:movify/features/search/presentation/blocs/search_bloc.dart';
import 'package:movify/features/search/presentation/cubits/search_history_cubit.dart';
import 'package:movify/features/settings/data/data_sources/local/settings_local_data_source.dart';
import 'package:movify/features/settings/data/data_sources/local/settings_local_data_source_impl.dart';
import 'package:movify/features/settings/data/repos/settings_repo_impl.dart';
import 'package:movify/features/settings/domain/repos/settings_repo.dart';
import 'package:movify/features/settings/domain/use_cases/get_is_first_time_use_case.dart';
import 'package:movify/features/settings/domain/use_cases/set_is_first_time_use_case.dart';
import 'package:movify/features/settings/presentation/cubits/settings_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  log('📦 Setting up dependencies...');

  // Order is critical — each step depends on the previous one.
  await _registerCoreSync(); // 1. infrastructure (Dio, Prefs, Firebase)
  _registerExternalDependencies(); // 2. third-party singletons
  _registerDataSources(); // 4. data sources (need AuthEventSink ready)
  _registerRepositories(); // 5. repos (need data sources + AuthEventSink)
  _registerUseCases(); // 6. use cases (need repos)
  _registerCubits(); // 7. feature cubits (need use cases)
  _registerAuthCubits(); // 8. session + login (need ListenToAuthEventsUseCase)
  _registerSettings(); // 9. settings
  _registerRouter(); // 10. router (needs SessionCubit + SettingsCubit)

  log('✅ Dependencies ready');
}

// ── 1. Core sync ──────────────────────────────────────────────────────────

Future<void> _registerCoreSync() async {
  log('⚙️ Registering core sync services');

  final sharedPrefs = await SharedPreferences.getInstance();
  if (!getIt.isRegistered<SharedPreferences>()) {
    getIt.registerSingleton<SharedPreferences>(sharedPrefs);
  }
  if (!getIt.isRegistered<ConnectivityCubit>()) {
    getIt.registerLazySingleton<ConnectivityCubit>(() => ConnectivityCubit());
  }
  if (!getIt.isRegistered<LanguageCubit>()) {
    getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  }
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton<Dio>(() => NetworkModule.provideDio());
  }
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
  AppDio.initialize(connectivityCubit: getIt<ConnectivityCubit>());
}

// ── 2. External ───────────────────────────────────────────────────────────

void _registerExternalDependencies() {
  if (!getIt.isRegistered<FirebaseAuth>()) {
    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  }
  if (!getIt.isRegistered<GoogleSignIn>()) {
    getIt.registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(scopes: ['email', 'profile']),
    );
  }
}

// ── 4. Data sources ───────────────────────────────────────────────────────

void _registerDataSources() {
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
  getIt.registerLazySingleton<LocalSearchHistoryDataSource>(
    () => LocalSearchDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () =>
        AuthLocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()),
  );
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

// ── 5. Repositories ───────────────────────────────────────────────────────

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
  final authRepoImpl = AuthRepoImpl(
    localDataSource: getIt<AuthLocalDataSource>(),
    remoteDataSource: getIt<AuthRemoteDataSource>(),
  );
  // AuthRepoImpl now receives AuthEventSink — it pushes events to the vendor.
  getIt.registerLazySingleton<AuthRepo>(() => authRepoImpl);
  getIt.registerLazySingleton<AuthStatusProvider>(
    () => getIt<AuthRepo>() as AuthStatusProvider,
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

// ── 6. Use cases ──────────────────────────────────────────────────────────

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
  // Note: ListenToAuthEventsUseCase is registered in _registerShared()
  // because repos need it before use cases are registered.
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

// ── 7. Feature cubits ─────────────────────────────────────────────────────

void _registerCubits() {
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  getIt.registerLazySingleton<MovieBloc>(
    () => MovieBloc(getMoviesUseCase: getIt<GetMoviesUseCase>()),
  );
  getIt.registerLazySingleton<SeriesBloc>(
    () => SeriesBloc(getSeriesUseCase: getIt<GetSeriesUseCase>()),
  );

  // FavoriteCubit now subscribes to auth stream autonomously.
  // No more UI coordination needed.
  getIt.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(
      mergeGuestFavoritesUseCase: getIt<MergeGuestFavoritesUseCase>(),
      pullCloudFavoritesUseCase: getIt<PullCloudFavoritesUseCase>(),
      getFavoritesUseCase: getIt<GetFavoritesUseCase>(),
      addFavoriteUseCase: getIt<AddFavoriteUseCase>(),
      removeFavoriteUseCase: getIt<RemoveFavoriteUseCase>(),
      authStatusProvider: getIt<AuthStatusProvider>(),
    ),
  );

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

// ── 8. Auth cubits ────────────────────────────────────────────────────────

void _registerAuthCubits() {
  // SessionCubit: simplified — no GetCurrentUserUseCase needed anymore.
  // Stream handles cold-start restore via AuthRepoImpl._initAuthState().
  getIt.registerLazySingleton<SessionCubit>(
    () => SessionCubit(
      signOutUseCase: getIt<SignOutUseCase>(),
      enableGuestModeUseCase: getIt<EnableGuestModeUseCase>(),
      disableGuestModeUseCase: getIt<DisableGuestModeUseCase>(),
      getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
      authStatusProvider: getIt<AuthStatusProvider>(),
    ),
  );
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(signInWithGoogleUseCase: getIt<SignInWithGoogleUseCase>()),
  );
}

// ── 9. Settings ───────────────────────────────────────────────────────────

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

// ── 10. Router ────────────────────────────────────────────────────────────

void _registerRouter() {
  getIt.registerLazySingleton<AppRouters>(
    () => AppRouters(
      sessionCubit: getIt<SessionCubit>(),
      settingsCubit: getIt<SettingsCubit>(),
    ),
  );
  getIt.registerLazySingleton<GoRouter>(
    () => getIt<AppRouters>().createRouter(),
  );
}
