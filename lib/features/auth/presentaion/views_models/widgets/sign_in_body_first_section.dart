import 'package:flutter/material.dart';

import '../../../../../core/utils/primary_texts.dart';
import 'sign_in_text_field.dart';

class SignInBodyFirstSection extends StatelessWidget {
  const SignInBodyFirstSection({
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
      children: [
        Expanded(
          flex: 2,
          child: const PrimaryTexts(
              title: 'Hi, Dear ',
              subtitle: 'Welcome back! Please enter your details.'),
        ),
        Expanded(
          flex: 2,
          child: SignInTextField(
            globalKey: _globalKey,
            emailContoller: emailContoller,
            passwordController: passwordController,
          ),
        ),
      ],
    );
  }
}
