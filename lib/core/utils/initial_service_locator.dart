// import 'package:cinemax_app_new/core/network/api/services/api_service.dart';
// import 'package:cinemax_app_new/core/network/config/network_module.dart';
// import 'package:cinemax_app_new/features/auth/data/repos/auth_repo_impl.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/facebook_sign_in_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/google_sign_in_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/register_account_use_case.dart';
// import 'package:cinemax_app_new/features/auth/domain/use_cases/sign_in_use_case.dart';
// import 'package:cinemax_app_new/features/favorite/data/local_favorite_data_source/local_favorite_data_source_impl.dart';
// import 'package:cinemax_app_new/features/favorite/data/remote_favorite_data_source/remote_favorite_data_source_impl.dart';
// import 'package:cinemax_app_new/features/favorite/data/repos/favorite_repo_impl.dart';
// import 'package:cinemax_app_new/features/favorite/domain/use_cases/manage_favorites_use_case.dart';
// import 'package:cinemax_app_new/features/home/data/data_soureces/remote_home_data_source.dart';
// import 'package:cinemax_app_new/features/home/data/repos/home_repo_impl.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_movie_details.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_now_playing_movie.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_popular_use_case.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_recommended_use_case.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_top_rated_movies.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_trending_movie_use_case.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_upcoming_movies.dart';
// import 'package:cinemax_app_new/features/home/presentation/cubit/fetch_movie_details_cubit/fetch_movie_details_cubit.dart';
// import 'package:cinemax_app_new/features/home/presentation/cubit/home_view_cubit.dart';
// import 'package:cinemax_app_new/features/search/data/data_sources/local_search_data_source.dart';
// import 'package:cinemax_app_new/features/search/data/data_sources/remote_search_data_source.dart';
// import 'package:cinemax_app_new/features/search/data/repos/search_repo_impl.dart';
// import 'package:cinemax_app_new/features/search/domain/use_case/search_history_use_case.dart';
// import 'package:cinemax_app_new/features/search/domain/use_case/search_movie_use_case.dart';
// import 'package:cinemax_app_new/features/search/domain/use_case/search_tv_show_use_case.dart';
// import 'package:cinemax_app_new/features/search/presentaion/view_models/manger/search_cubit/search_cubit.dart';
// import 'package:cinemax_app_new/features/series/data/data_soureces/remote_seires_tv_data_source.dart';
// import 'package:cinemax_app_new/features/series/data/repos/series_repo_impl.dart';
// import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_series_season_details.dart';
// import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_airing_today.use_case.dart';
// import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_popular_use_case.dart';
// import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_show_details_use_case.dart';
// import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_top_rated_use_case.dart';
// import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_trending_use_case.dart';
// import 'package:cinemax_app_new/features/series/presentation/cubit/series_view_cubit.dart';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';

// GetIt getIt = GetIt.instance;
// Future<void> initialServiceLocator() async {
//   // Network Layer
//   getIt.registerSingleton<Dio>(NetworkModule.provideDio());
//   getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));

//   // DATA SOURCES (Singleton - Heavy objects)
//   getIt.registerSingleton<RemoteHomeDataSourceImpl>(
//     RemoteHomeDataSourceImpl(apiService: getIt.get<ApiService>()),
//   );
//   getIt.registerSingleton<RemoteSearchDataSourceImpl>(
//     RemoteSearchDataSourceImpl(apiService: getIt.get<ApiService>()),
//   );
//   getIt.registerSingleton<LocalSearchDataSourceImpl>(
//     LocalSearchDataSourceImpl(),
//   );
//   getIt.registerSingleton<RemoteSeiresTvDataSourceImpl>(
//     RemoteSeiresTvDataSourceImpl(apiService: getIt.get<ApiService>()),
//   );

//   getIt.registerSingleton<RemoteFavoriteDataSourceImpl>(
//     RemoteFavoriteDataSourceImpl(),
//   );
//   getIt.registerSingleton<LocalFavoriteDataSourceImpl>(
//     LocalFavoriteDataSourceImpl(),
//   );
//   // REPOSITORIES (Singleton - Core business layer)
//   getIt.registerSingleton<HomeRepoImpl>(
//     HomeRepoImpl(remoteHomeDataSource: getIt.get<RemoteHomeDataSourceImpl>()),
//   );
//   getIt.registerSingleton<SearchRepoImpl>(
//     SearchRepoImpl(
//       remoteDataSource: getIt.get<RemoteSearchDataSourceImpl>(),
//       localSearchDataSource: getIt.get<LocalSearchDataSourceImpl>(),
//     ),
//   );
//   getIt.registerSingleton<SeriesRepoImpl>(
//     SeriesRepoImpl(
//       remoteSeiresTvDataSource: getIt.get<RemoteSeiresTvDataSourceImpl>(),
//     ),
//   );
//   getIt.registerSingleton<FavoriteRepoImpl>(
//     FavoriteRepoImpl(
//       remoteDataSource: getIt.get<RemoteFavoriteDataSourceImpl>(),
//       localDataSource: getIt.get<LocalFavoriteDataSourceImpl>(),
//     ),
//   );
//   getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
//   // USE CASES - AUTH (LazySingleton - Created when needed)

//   getIt.registerLazySingleton<GoogleSignInUseCase>(
//     () => GoogleSignInUseCase(authRepo: getIt.get<AuthRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FacebookSignInUseCase>(
//     () => FacebookSignInUseCase(authRepo: getIt.get<AuthRepoImpl>()),
//   );
//   getIt.registerLazySingleton<SignUpUseCase>(
//     () => SignUpUseCase(authRepo: getIt.get<AuthRepoImpl>()),
//   );
//   getIt.registerLazySingleton<SignInUseCase>(
//     () => SignInUseCase(authRepo: getIt.get<AuthRepoImpl>()),
//   );
//   // USE CASES - HOME (LazySingleton - Created when needed)
//   getIt.registerLazySingleton<FetchMovieDetailsUseCase>(
//     () => FetchMovieDetailsUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FetchNowPlayingUseCase>(
//     () => FetchNowPlayingUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FetchTopRatedMoviesUseCase>(
//     () => FetchTopRatedMoviesUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FetchPopularUseCase>(
//     () => FetchPopularUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FetchTrendingMoviesUseCase>(
//     () => FetchTrendingMoviesUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FetchUpcomingMovieCase>(
//     () => FetchUpcomingMovieCase(homeRepo: getIt.get<HomeRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FetchRecommendedUseCase>(
//     () => FetchRecommendedUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
//   );
//   // USE CASES - SERIES (LazySingleton)
//   getIt.registerLazySingleton<FetchSeriesSeasonDetailsUseCase>(
//     () => FetchSeriesSeasonDetailsUseCase(
//       seriesRepo: getIt.get<SeriesRepoImpl>(),
//     ),
//   );
//   getIt.registerLazySingleton<FetchTrendingTvShowUseCase>(
//     () => FetchTrendingTvShowUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FetchPopularTvShowsUseCase>(
//     () => FetchPopularTvShowsUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FetchTopRatedTvShowsUseCase>(
//     () => FetchTopRatedTvShowsUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
//   );
//   getIt.registerLazySingleton<FetchAiringTodayTvShowsUseCase>(
//     () =>
//         FetchAiringTodayTvShowsUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
//   );
//   // USE CASES - SEARCH (LazySingleton)
//   getIt.registerLazySingleton<SearchMovieUseCase>(
//     () => SearchMovieUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
//   );
//   getIt.registerLazySingleton<SearchTvShowUseCase>(
//     () => SearchTvShowUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
//   );
//   getIt.registerLazySingleton<SearchHistoryUseCase>(
//     () => SearchHistoryUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
//   );
//   // USE CASES - FAVORITE (LazySingleton)
//   getIt.registerLazySingleton<ManageFavoritesUseCase>(
//     () => ManageFavoritesUseCase(favoriteRepo: getIt.get<FavoriteRepoImpl>()),
//   );
//   // CUBITS (Factory - New instance per screen)

//   // Home Cubit
//   getIt.registerFactory<HomeViewCubit>(
//     () => HomeViewCubit(
//       fetchTrendingMovieUseCase: getIt<FetchTrendingMoviesUseCase>(),
//       fetchPopularUseCase: getIt<FetchPopularUseCase>(),
//       fetchUpcomingMovieCase: getIt<FetchUpcomingMovieCase>(),
//       fetchNowPlayingUseCase: getIt<FetchNowPlayingUseCase>(),
//       fetchTopRatedUseCase: getIt<FetchTopRatedMoviesUseCase>(),
//     ),
//   );
//   // Fetch Details Cubit
//   getIt.registerFactory<FetchDetailsCubit>(
//     () => FetchDetailsCubit(
//       fetchMovieDetailsUseCase: getIt<FetchMovieDetailsUseCase>(),
//       fetchTvShowDetailsUseCase: getIt<FetchTvShowDetailsUseCase>(),
//     ),
//   );
//   // Search Cubit
//   getIt.registerFactory<SearchCubit>(
//     () => SearchCubit(
//       getIt<SearchMovieUseCase>(),
//       getIt<SearchTvShowUseCase>(),
//       getIt<SearchHistoryUseCase>(),
//     ),
//   );
//   // Series Cubit
//   getIt.registerFactory<SeriesViewCubit>(
//     () => SeriesViewCubit(
//       fetchTrendingTvShowUseCase: getIt<FetchTrendingTvShowUseCase>(),
//       fetchPopularTvShowsUseCase: getIt<FetchPopularTvShowsUseCase>(),
//       fetchTopRatedTvShowsUseCase: getIt<FetchTopRatedTvShowsUseCase>(),
//       fetchAiringTodayTvShowsUseCase: getIt<FetchAiringTodayTvShowsUseCase>(),
//     ),
//   );
//   // getIt.registerFactory<AuthCubit>(
//   //   () => AuthCubit(
//   //     googleSignInUseCase: getIt<GoogleSignInUseCase>(),
//   //     facebookSignInUseCase: getIt<FacebookSignInUseCase>(),
//   //     signUpUseCase: getIt<SignUpUseCase>(),
//   //     signInUseCase: getIt<SignInUseCase>(),
//   //   ),
//   // );
// }
