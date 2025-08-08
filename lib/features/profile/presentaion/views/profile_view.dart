import 'package:cinemax_app_new/features/profile/presentaion/views/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ProfileViewBody()));
  }
}
