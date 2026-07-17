import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_colors.dart';

class ProgressDot extends StatelessWidget {
  const ProgressDot({
    super.key,
    required this.currentIndex,
    required this.totalCount,
  });

  final int currentIndex;
  final int totalCount;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      totalCount,
      (index) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: index == currentIndex ? 36 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: index == currentIndex
              ? AppPrimaryColors.blueAccent
              : const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
