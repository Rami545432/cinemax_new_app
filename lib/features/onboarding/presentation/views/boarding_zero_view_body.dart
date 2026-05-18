// import 'package:movify/features/onboarding/presentation/view_models/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:movify/features/onboarding/presentation/views/posters_background.dart';
import 'package:movify/features/onboarding/presentation/widgets/boarding_one_text_and_logo.dart';
import 'package:movify/features/onboarding/presentation/widgets/darknees_stack_layer.dart';

class BoardingZeroViewBody extends StatelessWidget {
  const BoardingZeroViewBody({super.key});

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      const Positioned.fill(child: PostersBackground()),
      const Positioned.fill(child: DarknessStackLayer()),

      Positioned(
        bottom: MediaQuery.sizeOf(context).height * 0.01,
        left: 0,
        right: 0,
        child: const BoardingOneTextAndLogo(),
      ),
    ],
  );
}
