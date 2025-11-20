import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/utils/primary_button.dart';
import 'package:cinemax_app_new/core/utils/text_button_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'initial_content.dart';

class InitialAuthFirstSection extends StatelessWidget {
  const InitialAuthFirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Expanded(flex: 3, child: const InitialContent()),
        Expanded(
          child: PrimaryButton(
            text: 'Sign up',
            onTap: () {
              context.pushNamed(RouteName.signUp);
            },
          ),
        ),
        const TextAndButtonRow(
          text: 'I already have an account ?',
          buttonText: 'Login',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
