import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../core/utils/primary_button.dart';
import '../manger/sign_in_cubit/sign_in_cubit.dart';

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
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          if (state.userData.emailVerify == true) {
            GoRouter.of(context).push(AppRouter.kNavigationView);
            showSnackBar(context, color: Colors.greenAccent, text: "Welcome");
          } else {
            showSnackBar(
              context,
              color: Colors.redAccent,
              text: 'Please Check Your Email and Verify it',
            );
          }
        }
        if (state is SignInFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: PrimaryButton(
        text: 'Log in',
        onTap: () async {
          if (_globalKey.currentState!.validate()) {
            BlocProvider.of<SignInCubit>(context).signIn(
              email: emailContoller.text,
              password: passwordController.text,
            );
          }
        },
      ),
    );
  }
}
