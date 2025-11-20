import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/functions/show_snack_bar.dart';
import 'package:cinemax_app_new/core/utils/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPassowrdButton extends StatelessWidget {
  const ResetPassowrdButton({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: SizedBox()),
        Expanded(
          child: PrimaryButton(
            text: 'Next',
            onTap: () async {
              try {
                await FirebaseAuth.instance.sendPasswordResetEmail(
                  email: emailController.text,
                );
                // ignore: use_build_context_synchronously
                context.pushNamed(
                  RouteName.verficationPasswordEmail,
                  extra: emailController.text,
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'channel-error') {
                  if (context.mounted) {
                    showSnackBar(
                      context,
                      color: Colors.red,
                      text: 'Please Enter Your Email',
                    );
                  }
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
