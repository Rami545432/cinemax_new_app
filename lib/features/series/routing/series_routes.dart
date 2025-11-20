import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/core/routing/transition/app_transition.dart';
import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/features/details/data/models/arguments/episode_view_argument.dart';
import 'package:cinemax_app_new/features/details/data/models/arguments/season_view_argument.dart';
import 'package:cinemax_app_new/features/details/presentation/views/episode_view.dart';
import 'package:cinemax_app_new/features/details/presentation/views/season_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';

class SeriesRoutes {
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
  ];
}
