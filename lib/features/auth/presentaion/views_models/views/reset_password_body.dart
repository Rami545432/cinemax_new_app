import 'package:flutter/material.dart';

import '../../../../../core/utils/custom_text_field.dart';
import '../../../../../core/utils/helper/responsive_padding.dart';
import '../../../../../core/utils/main_app_bar.dart';
import '../../../../../core/utils/primary_texts.dart';

import 'reset_password_button.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  late TextEditingController emailContoller;

  @override
  void initState() {
    emailContoller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getResponsivePadding(context, horizontal: 24),
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
              controller: emailContoller,
              hintText: 'Enter your Email',
              lable: 'Email Password',
            ),
          ),
          const SizedBox(height: 40),
          Expanded(child: ResetPassowrdButton(emailContoller: emailContoller)),
          Flexible(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}
