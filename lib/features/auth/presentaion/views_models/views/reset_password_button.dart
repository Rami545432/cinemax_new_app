import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../core/utils/primary_button.dart';

class ResetPassowrdButton extends StatelessWidget {
  const ResetPassowrdButton({
    super.key,
    required this.emailContoller,
  });

  final TextEditingController emailContoller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          child: PrimaryButton(
            text: 'Next',
            onTap: () async {
              try {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: emailContoller.text);
                // ignore: use_build_context_synchronously
                GoRouter.of(context).pushReplacement(
                    AppRouter.kVerficationPasswordEmailView,
                    extra: emailContoller.text);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'channel-error') {
                  // ignore: use_build_context_synchronously
                  showSnackBar(context,
                      color: Colors.red, text: 'Please Enter Your Email');
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
