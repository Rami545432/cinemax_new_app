import 'package:cinemax_app_new/core/utils/main_app_bar.dart';
import 'package:cinemax_app_new/core/utils/primary_texts.dart';
import 'package:flutter/material.dart';

class EmailResetPassowordView extends StatelessWidget {
  const EmailResetPassowordView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: EmailResetPassowordBody(email: email)),
    );
  }
}

class EmailResetPassowordBody extends StatelessWidget {
  const EmailResetPassowordBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MainAppBar(title: 'Reset Password'),
        const SizedBox(height: 40),
        PrimaryTexts(
          title: 'Reset Password Email Verify',
          subtitle: 'Please Check Your Email $email To Reset Your Password ',
        ),
      ],
    );
  }
}
