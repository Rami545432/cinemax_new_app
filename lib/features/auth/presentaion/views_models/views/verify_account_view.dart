import 'package:flutter/material.dart';

import 'verfiy_account_body.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: VerifyAccountBody()));
  }
}
