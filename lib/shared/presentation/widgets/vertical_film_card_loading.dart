import 'package:flutter/material.dart';
import 'package:movify/features/home/presentation/widgets/card_title.dart';

class VerticalFilmCardLoading extends StatelessWidget {
  const VerticalFilmCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final skeletonColor = isDark ? Colors.grey.shade800 : Colors.grey.shade200;

    return Column(
      spacing: 12,
      children: [
        Flexible(
          flex: 5,
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: skeletonColor,
              ),
            ),
          ),
        ),
        const Flexible(child: CardTitle(title: '')),
      ],
    );
  }
}
