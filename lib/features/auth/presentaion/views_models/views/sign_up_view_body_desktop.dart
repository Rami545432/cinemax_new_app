import 'package:flutter/material.dart';

import '../../../../../core/utils/helper/responsive_padding.dart';
import '../../../../../core/utils/main_app_bar.dart';
import '../widgets/sign_up_text_fields.dart';
import 'signing_view_body_first_section.dart';

class SignUpViewBodyDesktop extends StatelessWidget {
  const SignUpViewBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getResponsivePadding(context, horizontal: 24),
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
