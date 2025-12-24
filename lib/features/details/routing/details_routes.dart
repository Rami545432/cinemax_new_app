import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/core/routing/transition/app_transition.dart';
import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/details_params.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/details/data/models/arguments/episode_view_argument.dart';
import 'package:cinemax_app_new/features/details/data/models/arguments/season_view_argument.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/views/details_view.dart';
import 'package:cinemax_app_new/features/details/presentation/views/episode_view.dart';
import 'package:cinemax_app_new/features/details/presentation/views/season_view.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsRoutes {
  static List<GoRoute> get routes => [
    GoRoute(
      path: RoutePaths.season,
      name: RouteName.season,
      pageBuilder: (context, state) => AppTransitions.fadeThrough(
        child: BlocProvider(
          create: (context) => getIt.get<FetchSeriesSeasonDetailsCubit>(),
          child: SeasonView(
            seasonViewArgument: state.extra as SeasonViewArgument,
          ),
        ),
        state: state,
      ),
    ),
    GoRoute(
      path: RoutePaths.episode,
      name: RouteName.episode,
      pageBuilder: (context, state) => AppTransitions.slideFromBottom(
        child: BlocProvider(
          create: (context) => getIt.get<FetchSeriesSeasonDetailsCubit>(),
          child: EpisodeView(
            episodeViewArgument: state.extra as EpisodeViewArgument,
          ),
        ),
        state: state,
      ),
    ),
    GoRoute(
      path: RoutePaths.movieDetail,
      name: RouteName.movieDetail,
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        return AppTransitions.fadeScaleAnimation(
          state: state,
          child: BlocProvider(
            key: ValueKey('movie-$id'), // 🔑 guarantees disposal
            create: (_) =>
                getIt<FetchDetailsCubit>()
                  ..fetchDetails(DetailsParams(id: id, type: 'movie')),
            child: DetailsView(
              id: id,
              contentType: ContentType.movies,
              heroTag: state.uri.queryParameters['heroTag'],
              posterImage: state.uri.queryParameters['posterImage'] ?? '',
            ),
          ),
        );
      },
    ),

    GoRoute(
      path: RoutePaths.tvDetail,
      name: RouteName.tvDetail,
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        return AppTransitions.fadeScaleAnimation(
          state: state,
          child: BlocProvider(
            key: ValueKey('tv-$id'),
            create: (_) =>
                getIt<FetchDetailsCubit>()
                  ..fetchDetails(DetailsParams(id: id, type: 'tv')),
            child: DetailsView(
              id: id,
              contentType: ContentType.series,
              heroTag: state.uri.queryParameters['heroTag'],
              posterImage: state.uri.queryParameters['posterImage'] ?? '',
            ),
          ),
        );
      },
    ),
  ];
}
