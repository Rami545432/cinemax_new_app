import 'package:flutter/material.dart';
import 'package:movify/constants/welcome_assets.dart';
import 'package:movify/features/onboarding/presentation/widgets/posters_coulmns.dart';

class PostersBackground extends StatelessWidget {
  const PostersBackground({super.key});

  @override
  Widget build(BuildContext context) => const PostersCoulmns(
    column1Posters: WelcomeAssets.column1Posters,
    column2Posters: WelcomeAssets.column2Posters,
    column3Posters: WelcomeAssets.column3Posters,
  );
}
