import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/di/service_locator.dart';
import 'package:movify/core/routing/route_name.dart';
import 'package:movify/core/routing/route_paths.dart';
import 'package:movify/features/auth/presentation/cubits/login_cubit.dart';
import 'package:movify/features/auth/presentation/views/login_view.dart';

class AuthRoutes {
  static List<GoRoute> get routes => [
    GoRoute(
      path: RoutePaths.login,
      name: RouteName.login,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginView(),
      ),
    ),
  ];
}
