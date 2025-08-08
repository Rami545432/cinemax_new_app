import 'package:flutter/material.dart';

import 'initial_view_body.dart';

class InitialAuthView extends StatelessWidget {
  const InitialAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InitialAuthViewBody(),
      ),
    );
  }
}
