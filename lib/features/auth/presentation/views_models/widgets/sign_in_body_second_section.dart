import 'package:flutter/material.dart';
import 'forget_password_button.dart';
import 'sign_in_bloc_listener.dart';

class SignInBodySecondSection extends StatelessWidget {
  const SignInBodySecondSection({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        SignInBlocListiner(
          globalKey: _globalKey,
          emailContoller: emailContoller,
          passwordController: passwordController,
        ),
        ForgetPasswordButton(),
      ],
    );
  }
}
