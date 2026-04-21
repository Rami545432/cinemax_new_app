import 'dart:developer';

import 'package:cinemax_app_new/core/di/service_locator.dart';
import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/login_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/login_state.dart';
import 'package:cinemax_app_new/features/auth/presentation/cubits/session_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/views/login_view_body.dart';
import 'package:cinemax_app_new/shared/presentation/utils/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.read<SessionCubit>().checkAuthStatus();
            context.goNamed(RouteName.home);
            showSnackBar(context, color: Colors.green, text: 'Welcome !');
          }
          if (state is LoginFailure) {
            log(state.message);
            showSnackBar(context, color: Colors.red, text: state.message);
          }
        },
        child: const LoginViewBody(),
      ),
    ),
  );
}
