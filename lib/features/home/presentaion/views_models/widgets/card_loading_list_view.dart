import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/skeletionzed_loading_cards/vertical_film_card_loading.dart';

class CardListViewLoading extends StatelessWidget {
  const CardListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: AspectRatio(
        aspectRatio: 1.6,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 12),
              child: VerticalFilmCardLoading(),
            );
          },
        ),
      ),
    );
  }
}
