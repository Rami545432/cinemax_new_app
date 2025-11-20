import 'package:cinemax_app_new/core/routing/route_paths.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/route_name.dart';
import '../presentation/views_models/views/email_reset_passoword_view.dart';
import '../presentation/views_models/views/initial_auth_view.dart';
import '../presentation/views_models/views/new_password_view.dart';
import '../presentation/views_models/views/reset_password_view.dart';
import '../presentation/views_models/views/sign_in_view.dart';
import '../presentation/views_models/views/sign_up_view.dart';
import '../presentation/views_models/views/verify_account_view.dart';

class AuthRoutes {
  static List<GoRoute> get routes => [
    GoRoute(
      path: RoutePaths.initialAuth,
      name: RouteName.initialAuth,
      builder: (context, state) => const InitialAuthView(),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      name: RouteName.signUp,
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
      path: RoutePaths.signIn,
      name: RouteName.signIn,
      builder: (context, state) => SignInView(),
    ),
    GoRoute(
      path: RoutePaths.resetPassword,
      name: RouteName.resetPassword,
      builder: (context, state) => ResetPasswordView(),
    ),
    GoRoute(
      path: RoutePaths.newPassword,
      name: RouteName.newPassword,
      builder: (context, state) => const NewPasswordView(),
    ),
    GoRoute(
      path: RoutePaths.verification,
      name: RouteName.verification,
      builder: (context, state) => const VerifyAccountView(),
    ),
    GoRoute(
      path: RoutePaths.verficationPasswordEmail,
      name: RouteName.verficationPasswordEmail,
      builder: (context, state) =>
          EmailResetPassowordView(email: state.extra as String),
    ),
  ];
}
