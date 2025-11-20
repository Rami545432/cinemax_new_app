import 'package:flutter/material.dart';

import 'new_password_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: NewPasswordBody()));
  }
}
