import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnBoardingIconBadge extends StatelessWidget {
  const OnBoardingIconBadge({
    super.key,
    required this.icon,
    required this.colorsGradient,
  });

  final IconData icon;
  final List<Color> colorsGradient;

  @override
  Widget build(BuildContext context) => Animate(
    effects: const [
      FadeEffect(
        delay: Duration(milliseconds: 120),
        duration: Duration(milliseconds: 300),
      ),
      ScaleEffect(
        delay: Duration(milliseconds: 120),
        begin: Offset(0.9, 0.9),
        end: Offset(1, 1),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      ),
    ],
    child: Transform.translate(
      offset: const Offset(0, -32),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colorsGradient),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 32),
      ),
    ),
  );
}
