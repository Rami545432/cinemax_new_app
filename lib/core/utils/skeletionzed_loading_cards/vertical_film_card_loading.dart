import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/card_title.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../rating.dart';

class VerticalFilmCardLoading extends StatelessWidget {
  const VerticalFilmCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final skeletonColor = isDark ? Colors.grey.shade800 : Colors.grey.shade200;

    return Skeletonizer(
      enabled: true,
      containersColor: skeletonColor,
      child: Column(
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
                child: Rating(rating: 4.5),
              ),
            ),
          ),
          Flexible(child: CardTitle(title: 'title')),
        ],
      ),
    );
  }
}
