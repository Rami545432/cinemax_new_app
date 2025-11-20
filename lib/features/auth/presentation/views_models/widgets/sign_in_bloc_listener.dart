import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/functions/show_snack_bar.dart';
import 'package:cinemax_app_new/core/utils/primary_button.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_cubit.dart';
import 'package:cinemax_app_new/features/auth/presentation/views_models/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInBlocListiner extends StatelessWidget {
  const SignInBlocListiner({
    super.key,
    required GlobalKey<FormState> globalKey,
    required this.emailContoller,
    required this.passwordController,
  }) : _globalKey = globalKey;

  final GlobalKey<FormState> _globalKey;
  final TextEditingController emailContoller;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.goNamed(RouteName.home);
          showSnackBar(context, color: Colors.greenAccent, text: "Welcome");
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: PrimaryButton(
        text: 'Log in',
        onTap: () async {
          if (_globalKey.currentState!.validate()) {
            context.read<AuthCubit>().signInWithEmail(
              email: emailContoller.text,
              password: passwordController.text,
            );
          }
        },
      ),
    );
  }
}
