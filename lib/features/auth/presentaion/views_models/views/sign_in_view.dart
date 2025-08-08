import 'package:flutter/material.dart';

import '../../../../../core/utils/helper/adaptive_layout_widget.dart';
import 'sign_in_body.dart';
import 'sign_in_desktop_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return AdaptiveLayoutWidget(
              mobile: (context) => SignInBody(),
              desktop: (context) => SignInDesktopBody(),
              tablet: (context) => SignInBody(),
            );
          },
        ),
      ),
    );
  }
}
