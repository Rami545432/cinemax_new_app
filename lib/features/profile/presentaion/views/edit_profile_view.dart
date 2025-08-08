import 'package:flutter/material.dart';

import 'edit_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: EditProfileViewBody(),
    ));
  }
}
