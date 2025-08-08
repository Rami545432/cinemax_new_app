import 'package:flutter/material.dart';

import '../../../../../core/utils/helper/responsive_padding.dart';
import '../../../../../core/utils/main_app_bar.dart';
import '../widgets/sign_in_body_first_section.dart';
import '../widgets/sign_in_body_second_section.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
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
      padding: getResponsivePadding(context, horizontal: 24),
      child: Column(
        children: [
          const MainAppBar(title: 'Login'),
          Expanded(
            flex: 3,
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
    );
  }
}
