import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FloatingParticlesEffect extends StatelessWidget {
  const FloatingParticlesEffect({super.key, required this.random});

  final double random;

  @override
  Widget build(BuildContext context) => Animate(
    onPlay: (controller) => controller.repeat(),
    effects: [
      FadeEffect(
        begin: 0.3,
        end: 0.0,
        duration: Duration(milliseconds: 2000 + (random * 1000).toInt()),
      ),
    ],
    child: Container(
      width: 2,
      height: 2,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    ),
  );
}
