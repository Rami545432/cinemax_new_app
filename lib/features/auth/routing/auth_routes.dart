import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:cinemax_app_new/features/auth/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  static List<GoRoute> get routes => [
    GoRoute(
      path: RoutePaths.login,
      name: RouteName.login,
      builder: (context, state) => const LoginView(),
    ),
  ];
}
