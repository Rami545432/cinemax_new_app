import 'package:cinemax_app_new/core/utils/custom_text_field.dart';
import 'package:cinemax_app_new/core/utils/main_app_bar.dart';
import 'package:cinemax_app_new/core/utils/primary_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'reset_password_button.dart';

class ResetPasswordBody extends HookWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const MainAppBar(title: 'Reset Password'),
          Expanded(
            child: PrimaryTexts(
              title: 'Reset Password',
              subtitle: 'Recover Your Account Password',
            ),
          ),
          const SizedBox(height: 48),
          Expanded(
            child: CustomTextField(
              controller: emailController,
              hintText: 'Enter your Email',
              lable: 'Email Address',
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ResetPassowrdButton(emailController: emailController),
          ),
          Flexible(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
