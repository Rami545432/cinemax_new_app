import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/core/routing/transition/app_transition.dart';
import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_details_cubit/fetch_details_cubit.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/recommended_movies_cubit/recommended_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/views/details_view.dart';
import 'package:cinemax_app_new/features/home/presentation/views_models/views/discover_view.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

class HomeRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: RoutePaths.detail,
      name: RouteName.detail,
      pageBuilder: (context, state) => AppTransitions.sharedAxisY(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt.get<FetchDetailsCubit>()),
            BlocProvider(
              create: (context) => getIt.get<FetchRecommendedCubit>(),
            ),
          ],
          child: DetailsView(
            cardModel: state.extra as BaseCardModel,
            title: state.uri.queryParameters['title'],
          ),
        ),
        state: state,
      ),
    ),

    GoRoute(
      path: RoutePaths.discover,
      name: RouteName.discover,
      builder: (context, state) => const DiscoverView(),
    ),
  ];
}
