import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/core/routing/transition/app_transition.dart';
import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_see_all_arguments.dart';
import 'package:cinemax_app_new/features/discover/presentation/cubit/genre_content_cubit.dart';
import 'package:cinemax_app_new/features/discover/presentation/widget/genre_see_all_view_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DiscoverRouting {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.genreSeeAll,
      name: RouteName.genreSeeAll,
      pageBuilder: (context, state) => AppTransitions.fadeScaleAnimation(
        child: BlocProvider(
          create: (context) => getIt.get<GenreContentCubit>(),
          child: GenreSeeAllWrapper(
            arguments: state.extra as GenreSeeAllArguments,
          ),
        ),
        state: state,
      ),
    ),
  ];
}
