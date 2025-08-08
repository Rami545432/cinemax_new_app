import 'package:flutter/material.dart';

import '../../../../../core/utils/helper/adaptive_layout_widget.dart';
import 'sign_up_view_body.dart';
import 'sign_up_view_body_desktop.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AdaptiveLayoutWidget(
        desktop: (context) => SignUpViewBodyDesktop(),
        mobile: (context) => SignUpViewBody(),
        tablet: (context) => SignUpViewBody(),
      ),
    );
  }
}
