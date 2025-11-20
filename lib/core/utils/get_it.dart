import 'dart:developer';
import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
import 'package:cinemax_app_new/core/network/config/network_module.dart';
import 'package:cinemax_app_new/core/theme/cubit/theme_cubit.dart';
import 'package:cinemax_app_new/features/auth/data/data_soureces/auth_local_data_source.dart';
import 'package:cinemax_app_new/features/auth/data/data_soureces/auth_remote_data_source.dart';
import 'package:cinemax_app_new/features/auth/data/repos/auth_repo_impl.dart';
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
import 'package:cinemax_app_new/features/details/data/remote_details_data_source/remote_details_data_source.dart';
import 'package:cinemax_app_new/features/details/data/repos/details_repo_impl.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_similar_use_case.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_similar_cubit.dart';
import 'package:cinemax_app_new/features/favorite/data/local_favorite_data_source/local_favorite_data_source_impl.dart';
import 'package:cinemax_app_new/features/favorite/data/remote_favorite_data_source/remote_favorite_data_source_impl.dart';
import 'package:cinemax_app_new/features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:cinemax_app_new/features/favorite/domain/use_cases/manage_favorites_use_case.dart';
import 'package:cinemax_app_new/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:cinemax_app_new/features/home/data/data_soureces/remote_home_data_source.dart';
import 'package:cinemax_app_new/features/home/data/repos/home_repo_impl.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_movie_details_use_case.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_now_playing_movie.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_popular_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_recommended_use_case.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_top_rated_movies.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_trending_movie_use_case.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_upcoming_movies.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/home_view_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/recommended_movies_cubit/recommended_cubit.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/local_search_data_source.dart';
import 'package:cinemax_app_new/features/search/data/data_sources/remote_search_data_source.dart';
import 'package:cinemax_app_new/features/search/data/repos/search_repo_impl.dart';
import 'package:cinemax_app_new/features/search/domain/use_case/search_history_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_case/search_movie_use_case.dart';
import 'package:cinemax_app_new/features/search/domain/use_case/search_tv_show_use_case.dart';
import 'package:cinemax_app_new/features/search/presentaion/view_models/manger/search_cubit/search_cubit.dart';
import 'package:cinemax_app_new/features/series/data/data_soureces/remote_seires_tv_data_source.dart';
import 'package:cinemax_app_new/features/series/data/repos/series_repo_impl.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_series_season_details.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_airing_today.use_case.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_popular_use_case.dart';
import 'package:cinemax_app_new/features/details/domain/use_cases/fetch_tv_show_details_use_case.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_top_rated_use_case.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_trending_use_case.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:cinemax_app_new/features/series/presentation/cubit/series_view_cubit.dart';
import 'package:cinemax_app_new/l10n/local_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

/// Lightweight synchronous initialization - registers only essential lightweight dependencies
void initialServiceLocatorSync() {
  log('📦 Initializing service locator (sync)...');

  // Network Layer - lightweight
  getIt.registerSingleton<Dio>(NetworkModule.provideDio());

  // ConnectivityCubit is registered early in main.dart before AppDio.initialize()
  getIt.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

  getIt.registerSingleton<ApiService>(
    ApiService(
      getIt.get<Dio>(),
      getIt.get<LocaleCubit>().state.locale.languageCode,
    ),
  );

  log('✅ Sync service locator initialized');
}

/// Full async initialization - registers heavy dependencies and data sources
Future<void> initialServiceLocator() async {
  log('📦 Initializing full service locator (async)...');

  // External Dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerLazySingleton<GoogleSignIn>(
    () => GoogleSignIn(scopes: ['email', 'profile']),
  );

  getIt.registerLazySingleton<FacebookAuth>(() => FacebookAuth.instance);

  // DATA SOURCES (Singleton - Heavy objects)
  getIt.registerSingleton<RemoteHomeDataSourceImpl>(
    RemoteHomeDataSourceImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<RemoteSearchDataSourceImpl>(
    RemoteSearchDataSourceImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerSingleton<RemoteSeiresTvDataSourceImpl>(
    RemoteSeiresTvDataSourceImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<LocalSearchDataSourceImpl>(
    LocalSearchDataSourceImpl(),
  );
  getIt.registerSingleton<RemoteFavoriteDataSourceImpl>(
    RemoteFavoriteDataSourceImpl(),
  );
  getIt.registerSingleton<LocalFavoriteDataSourceImpl>(
    LocalFavoriteDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthLocalDataSourceImpl>(
    () => AuthLocalDataSourceImpl(
      sharedPreferences: getIt.get<SharedPreferences>(),
    ),
  );
  getIt.registerLazySingleton<AuthRemoteDataSourceImpl>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      googleSignIn: getIt.get<GoogleSignIn>(),
      facebookAuth: getIt.get<FacebookAuth>(),
    ),
  );
  // REPOSITORIES (Singleton - Core business layer)
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(remoteHomeDataSource: getIt.get<RemoteHomeDataSourceImpl>()),
  );
  getIt.registerSingleton<RemoteDetailsDataSourceImpl>(
    RemoteDetailsDataSourceImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<DetailsRepoImpl>(
    DetailsRepoImpl(
      remoteDetailsDataSource: getIt.get<RemoteDetailsDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      remoteDataSource: getIt.get<RemoteSearchDataSourceImpl>(),
      localSearchDataSource: getIt.get<LocalSearchDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<SeriesRepoImpl>(
    SeriesRepoImpl(
      remoteSeiresTvDataSource: getIt.get<RemoteSeiresTvDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<FavoriteRepoImpl>(
    FavoriteRepoImpl(
      remoteDataSource: getIt.get<RemoteFavoriteDataSourceImpl>(),
      localDataSource: getIt.get<LocalFavoriteDataSourceImpl>(),
    ),
  );
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(
      localDataSource: getIt.get<AuthLocalDataSourceImpl>(),
      remoteDataSource: getIt.get<AuthRemoteDataSourceImpl>(),
    ),
  );
  // USE CASES - AUTH (LazySingleton - Created when needed)

  getIt.registerLazySingleton(
    () => SignInWithGoogleUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => SignInWithFacebookUseCase(authRepo: getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => SignInWithEmailUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => SignUpWithEmailUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(() => SignOutUseCase(getIt.get<AuthRepoImpl>()));
  getIt.registerLazySingleton(
    () => ContinueAsGuestUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => GetCurrentUserUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => ResetPasswordUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => CheckAuthStatusUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => EnableGuestModeUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => DisableGuestModeUseCase(getIt.get<AuthRepoImpl>()),
  );
  getIt.registerLazySingleton(
    () => IsGuestModeUseCase(getIt.get<AuthRepoImpl>()),
  );
  // USE CASES - HOME (LazySingleton - Created when needed)
  getIt.registerLazySingleton<FetchMovieDetailsUseCase>(
    () => FetchMovieDetailsUseCase(detailsRepo: getIt.get<DetailsRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchTvShowDetailsUseCase>(
    () => FetchTvShowDetailsUseCase(detailsRepo: getIt.get<DetailsRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchNowPlayingUseCase>(
    () => FetchNowPlayingUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchTopRatedMoviesUseCase>(
    () => FetchTopRatedMoviesUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchPopularUseCase>(
    () => FetchPopularUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchTrendingMoviesUseCase>(
    () => FetchTrendingMoviesUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchUpcomingMovieCase>(
    () => FetchUpcomingMovieCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchRecommendedUseCase>(
    () => FetchRecommendedUseCase(detailsRepo: getIt.get<DetailsRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchSimilarUseCase>(
    () => FetchSimilarUseCase(detailsRepo: getIt.get<DetailsRepoImpl>()),
  );
  // USE CASES - SERIES (LazySingleton)
  getIt.registerLazySingleton<FetchSeriesSeasonDetailsUseCase>(
    () => FetchSeriesSeasonDetailsUseCase(
      detailsRepo: getIt.get<DetailsRepoImpl>(),
    ),
  );
  getIt.registerLazySingleton<FetchTrendingTvShowUseCase>(
    () => FetchTrendingTvShowUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
  );

  getIt.registerLazySingleton<FetchPopularTvShowsUseCase>(
    () => FetchPopularTvShowsUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchTopRatedTvShowsUseCase>(
    () => FetchTopRatedTvShowsUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
  );
  getIt.registerLazySingleton<FetchAiringTodayTvShowsUseCase>(
    () =>
        FetchAiringTodayTvShowsUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
  );
  // USE CASES - SEARCH (LazySingleton)
  getIt.registerLazySingleton<SearchMovieUseCase>(
    () => SearchMovieUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
  );
  getIt.registerLazySingleton<SearchTvShowUseCase>(
    () => SearchTvShowUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
  );
  getIt.registerLazySingleton<SearchHistoryUseCase>(
    () => SearchHistoryUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
  );
  // USE CASES - FAVORITE (LazySingleton)
  getIt.registerLazySingleton<ManageFavoritesUseCase>(
    () => ManageFavoritesUseCase(favoriteRepo: getIt.get<FavoriteRepoImpl>()),
  );
  // CUBITS (Factory - New instance per screen)

  // Home Cubit
  getIt.registerLazySingleton<HomeViewCubit>(
    () => HomeViewCubit(
      fetchTrendingMovieUseCase: getIt.get<FetchTrendingMoviesUseCase>(),
      fetchPopularUseCase: getIt.get<FetchPopularUseCase>(),
      fetchUpcomingMovieCase: getIt.get<FetchUpcomingMovieCase>(),
      fetchNowPlayingUseCase: getIt.get<FetchNowPlayingUseCase>(),
      fetchTopRatedUseCase: getIt.get<FetchTopRatedMoviesUseCase>(),
    ),
  );
  // Fetch Details Cubit
  getIt.registerFactory<FetchDetailsCubit>(
    () => FetchDetailsCubit(
      fetchMovieDetailsUseCase: getIt.get<FetchMovieDetailsUseCase>(),
      fetchTvShowDetailsUseCase: getIt.get<FetchTvShowDetailsUseCase>(),
    ),
  );
  // Search Cubit
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(
      getIt.get<SearchMovieUseCase>(),
      getIt.get<SearchTvShowUseCase>(),
      getIt.get<SearchHistoryUseCase>(),
    ),
  );
  // Series Cubit
  getIt.registerLazySingleton<SeriesViewCubit>(
    () => SeriesViewCubit(
      fetchTrendingTvShowUseCase: getIt.get<FetchTrendingTvShowUseCase>(),
      fetchPopularTvShowsUseCase: getIt.get<FetchPopularTvShowsUseCase>(),
      fetchTopRatedTvShowsUseCase: getIt.get<FetchTopRatedTvShowsUseCase>(),
      fetchAiringTodayTvShowsUseCase: getIt
          .get<FetchAiringTodayTvShowsUseCase>(),
    ),
  );
  getIt.registerFactory(
    () => FetchSeriesSeasonDetailsCubit(
      getIt.get<FetchSeriesSeasonDetailsUseCase>(),
    ),
  );
  getIt.registerFactory<FetchRecommendedCubit>(
    () => FetchRecommendedCubit(getIt.get<FetchRecommendedUseCase>()),
  );
  getIt.registerFactory<FetchSimilarCubit>(
    () => FetchSimilarCubit(getIt.get<FetchSimilarUseCase>()),
  );
  getIt.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(
      manageFavoritesUseCase: getIt.get<ManageFavoritesUseCase>(),
    ),
  );
  // Note: AuthCubit is registered in main.dart after all dependencies are ready

  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(getIt.get<SharedPreferences>()),
  );

  log('✅ Full service locator initialized');
}
