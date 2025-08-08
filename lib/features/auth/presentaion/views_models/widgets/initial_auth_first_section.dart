import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../core/utils/primary_button.dart';
import '../../../../../core/utils/text_button_row.dart';
import 'initial_content.dart';

class InitialAuthFirstSection extends StatelessWidget {
  const InitialAuthFirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Expanded(
          flex: 3,
          child: const InitialContent(),
        ),
        Expanded(
          child: PrimaryButton(
            text: 'Sign up',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSignUpView);
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
