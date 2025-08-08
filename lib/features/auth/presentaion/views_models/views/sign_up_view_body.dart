import 'package:flutter/material.dart';

import '../../../../../core/utils/helper/responsive_padding.dart';
import '../../../../../core/utils/main_app_bar.dart';
import '../../../../../core/utils/primary_texts.dart';
import '../widgets/sign_up_text_fields.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getResponsivePadding(context, horizontal: 24, vertical: 10),
      child: Column(
        children: const [
          MainAppBar(title: 'Sign up'),
          Expanded(
            child: PrimaryTexts(
              title: 'Let’s get started',
              subtitle: 'The latest movies and series are here',
            ),
          ),
          Expanded(flex: 2, child: SignUpTextFields()),
        ],
      ),
    );
  }
}
