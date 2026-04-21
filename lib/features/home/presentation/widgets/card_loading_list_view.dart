import 'package:cinemax_app_new/shared/presentation/widgets/vertical_film_card_loading.dart';
import 'package:flutter/material.dart';

class CardListViewLoading extends StatelessWidget {
  const CardListViewLoading({super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 1.2,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 23),
      itemCount: 10,
      separatorBuilder: (_, _) => const SizedBox(width: 20, height: 20),
      itemBuilder: (context, index) => const VerticalFilmCardLoading(),
    ),
  );
}
