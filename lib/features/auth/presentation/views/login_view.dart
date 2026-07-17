import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movify/core/routing/route_paths.dart';
import 'package:movify/core/utils/app_logger.dart';
import 'package:movify/features/auth/presentation/cubits/login_cubit.dart';
import 'package:movify/features/auth/presentation/cubits/login_state.dart';
import 'package:movify/features/auth/presentation/cubits/session_cubit.dart';
import 'package:movify/features/auth/presentation/views/login_view_body.dart';
import 'package:movify/shared/presentation/utils/show_snack_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      listener: (context, state) {
        if (state is LoginSuccess) {
          showSnackBar(context, color: Colors.green, text: 'Welcome !');
          // ✅ Notify SessionCubit so it updates to SessionAuthenticated globally
          context.read<SessionCubit>().checkAuthStatus(isExplicitSignIn: true);
          context.go(RoutePaths.home);
        }
        if (state is LoginFailure) {
          AppLogger.log(state.message);
          showSnackBar(context, color: Colors.red, text: state.message);
        }
      },
      child: const LoginViewBody(),
    ),
  );
}
