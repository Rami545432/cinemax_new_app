import 'package:cinemax_app_new/core/utils/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/sign_in_body_first_section.dart';
import '../widgets/sign_in_body_second_section.dart';

class SignInBody extends HookWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    final globalKey = useMemoized(() => GlobalKey<FormState>(), []);
    final emailContoller = useTextEditingController();
    final passwordController = useTextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const MainAppBar(title: 'Login'),
          Expanded(
            flex: 3,
            child: SignInBodyFirstSection(
              globalKey: globalKey,
              emailContoller: emailContoller,
              passwordController: passwordController,
            ),
          ),
          Expanded(
            child: SignInBodySecondSection(
              globalKey: globalKey,
              emailContoller: emailContoller,
              passwordController: passwordController,
            ),
          ),
        ],
      ),
    );
  }
}
