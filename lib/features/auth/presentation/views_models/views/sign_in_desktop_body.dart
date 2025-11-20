import 'package:cinemax_app_new/core/utils/main_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/sign_in_body_first_section.dart';
import '../widgets/sign_in_body_second_section.dart';

class SignInDesktopBody extends StatefulWidget {
  const SignInDesktopBody({super.key});

  @override
  State<SignInDesktopBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInDesktopBody> {
  late TextEditingController emailContoller, passwordController;
  late GlobalKey<FormState> _globalKey;
  @override
  void initState() {
    emailContoller = TextEditingController();
    passwordController = TextEditingController();
    _globalKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    emailContoller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const MainAppBar(title: 'Login'),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SignInBodyFirstSection(
                    globalKey: _globalKey,
                    emailContoller: emailContoller,
                    passwordController: passwordController,
                  ),
                ),
                Expanded(
                  child: SignInBodySecondSection(
                    globalKey: _globalKey,
                    emailContoller: emailContoller,
                    passwordController: passwordController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
