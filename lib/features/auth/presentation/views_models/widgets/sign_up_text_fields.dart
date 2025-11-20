import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/functions/show_snack_bar.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'sign_up_text_field_and_button.dart';

class SignUpTextFields extends StatelessWidget {
  const SignUpTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.pushNamed(RouteName.signIn);
          showSnackBar(
            context,
            color: Colors.greenAccent,
            text: ' Verification Code  Has Sent Please Verify Your Email ',
          );
        }
        if (state is AuthError) {
          showSnackBar(context, color: Colors.redAccent, text: state.message);
        }
      },
      child: SignUpTextFieldsAndButton(),
    );
  }
}
