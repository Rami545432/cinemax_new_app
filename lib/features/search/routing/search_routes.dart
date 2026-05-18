import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/routing/route_paths.dart';
import 'package:movify/core/routing/transition/app_transition.dart';
import 'package:movify/features/search/presentation/widgets/search_provider.dart';

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
