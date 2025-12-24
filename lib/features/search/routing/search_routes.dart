import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/core/routing/transition/app_transition.dart';
import 'package:cinemax_app_new/core/utils/bloc_provieders_views/search_provider.dart';
import 'package:go_router/go_router.dart';

class SearchRoutes {
  static List<GoRoute> get routes => [
    GoRoute(
      path: RoutePaths.search,
      name: RouteName.search,
      pageBuilder: (context, state) => AppTransitions.noTransition(
        child: const SearchMultiProviders(),
        state: state,
      ),
    ),
  ];
}
