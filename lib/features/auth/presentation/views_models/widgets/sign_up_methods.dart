import 'dart:developer';

import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';

import 'social_media_method_section.dart';

class SignUpMethods extends StatelessWidget {
  const SignUpMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.goNamed(RouteName.home);
          showSnackBar(context, color: Colors.greenAccent, text: 'Welcome !');
        }
        if (state is AuthError) {
          log(state.message);
          showSnackBar(context, color: Colors.red, text: state.message);
        }
      },
      child: SocialMediaMethodSection(),
    );
  }
}
