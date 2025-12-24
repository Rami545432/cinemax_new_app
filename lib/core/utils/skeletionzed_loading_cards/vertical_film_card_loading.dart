import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/card_title.dart';
import 'package:flutter/material.dart';

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
        Flexible(child: CardTitle(title: '')),
      ],
    );
  }
}
