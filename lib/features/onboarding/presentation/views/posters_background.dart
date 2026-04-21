import 'package:cinemax_app_new/constants/welcome_assets.dart';
import 'package:cinemax_app_new/features/onboarding/presentation/widgets/posters_coulmns.dart';
import 'package:flutter/material.dart';

class PostersBackground extends StatelessWidget {
  const PostersBackground({super.key});

  @override
  Widget build(BuildContext context) => const PostersCoulmns(
    column1Posters: WelcomeAssets.column1Posters,
    column2Posters: WelcomeAssets.column2Posters,
    column3Posters: WelcomeAssets.column3Posters,
  );
}
