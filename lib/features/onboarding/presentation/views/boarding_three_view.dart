import 'package:flutter/material.dart';
import 'package:movify/features/onboarding/presentation/views/boarding_three_view_body.dart';

class BoardingThreeView extends StatelessWidget {
  const BoardingThreeView({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: SafeArea(child: BoardingThreeViewBody()));
}
