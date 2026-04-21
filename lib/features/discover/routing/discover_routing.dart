import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/core/routing/transition/app_transition.dart';
import 'package:cinemax_app_new/core/utils/helper/get_gener_name.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_see_all_arguments.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_movie_by_genre_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_movie_by_keywords_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_series_by_genre_use_case.dart';
import 'package:cinemax_app_new/features/discover/domain/use_cases/fetch_series_by_keywords_use_case.dart';
import 'package:cinemax_app_new/features/discover/presentation/blocs/fetch_genre_bloc.dart';
import 'package:cinemax_app_new/features/discover/presentation/blocs/fetch_items_by_keywords_bloc.dart';
import 'package:cinemax_app_new/features/discover/presentation/core/collection_model.dart';
import 'package:cinemax_app_new/features/discover/presentation/views/collection_view.dart';
import 'package:cinemax_app_new/features/discover/presentation/views/genre_view.dart';
import 'package:cinemax_app_new/features/discover/presentation/views/notification_testing_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DiscoverRouting {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.genreSeeAll,
      name: RouteName.genreSeeAll,
      pageBuilder: (context, state) => AppTransitions.fadeScaleAnimation(
        child: BlocProvider(
          create: (context) => FetchGenreBloc(
            fetchMoviesByGenreUseCase: getIt.get<FetchMoviesByGenreUseCase>(),
            fetchSeriesByGenreUseCase: getIt.get<FetchSeriesByGenreUseCase>(),
            genreId: (state.extra as GenreSeeAllArguments).genreId,
          ),
          child: GenreView(
            genreId: (state.extra as GenreSeeAllArguments).genreId,
            genreName: getGenreName(
              (state.extra as GenreSeeAllArguments).genreId,
              context,
            ),
            selectedCategory: (state.extra as GenreSeeAllArguments).category,
          ),
        ),
        state: state,
      ),
    ),
    GoRoute(
      path: RoutePaths.modeView,
      name: RouteName.modeView,
      pageBuilder: (context, state) => AppTransitions.fadeScaleAnimation(
        child: BlocProvider(
          create: (context) => FetchItemsByKeywordsBloc(
            fetchMoviesByKeywordsUseCase: getIt
                .get<FetchMoviesByKeywordsUseCase>(),
            fetchSeriesByKeywordsUseCase: getIt
                .get<FetchSeriesByKeywordsUseCase>(),
            keywordId: (state.extra as CollectionModel).keyword,
          ),
          child: CollectionView(
            collectionModel: state.extra as CollectionModel,
          ),
        ),
        state: state,
      ),
    ),
    GoRoute(
      path: RoutePaths.notificationTesting,
      name: RouteName.notificationTesting,
      pageBuilder: (context, state) => AppTransitions.fadeScaleAnimation(
        child: const NotificationLabPage(),
        state: state,
      ),
    ),
  ];
}
