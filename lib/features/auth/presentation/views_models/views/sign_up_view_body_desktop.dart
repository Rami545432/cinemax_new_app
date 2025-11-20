import 'package:cinemax_app_new/core/utils/main_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/sign_up_text_fields.dart';
import 'signing_view_body_first_section.dart';

class SignUpViewBodyDesktop extends StatelessWidget {
  const SignUpViewBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 30,
        children: [
          MainAppBar(title: 'Sign Up'),
          Expanded(
            child: Row(
              children: const [
                Expanded(flex: 2, child: SignUpTextFields()),
                Expanded(child: SignUpViewBodyFirstSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
