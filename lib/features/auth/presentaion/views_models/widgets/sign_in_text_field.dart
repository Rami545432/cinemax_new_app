import 'package:flutter/material.dart';

import '../../../../../core/utils/custom_text_field.dart';

class SignInTextField extends StatelessWidget {
  const SignInTextField({
    super.key,
    required this.globalKey,
    required this.emailContoller,
    required this.passwordController,
  });
  final GlobalKey<FormState> globalKey;
  final TextEditingController emailContoller;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          Expanded(
            child: CustomTextField(
              hintText: 'Enter your Email',
              lable: 'Email Address',
              controller: emailContoller,
              onFieldSubmitted: (data) {
                emailContoller.text = data!;
              },
            ),
          ),
          Expanded(
            child: CustomTextField(
              hintText: 'Enter your Password',
              lable: 'Password',
              controller: passwordController,
              onFieldSubmitted: (data) {
                passwordController.text = data!;
              },
            ),
          ),
        ],
      ),
    );
  }
}
