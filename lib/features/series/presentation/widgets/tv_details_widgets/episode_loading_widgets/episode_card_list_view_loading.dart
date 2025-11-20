// ignore: unused_import
import 'package:cinemax_app_new/features/details/domain/entites/series_details_entity.dart';
import 'package:cinemax_app_new/features/series/presentation/widgets/tv_details_widgets/episode_loading_widgets/episode_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EpisodeCardListViewBuilderLoading extends StatelessWidget {
  const EpisodeCardListViewBuilderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Skeletonizer(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: EpisodeCardLoading(),
            );
          },
        ),
      ),
    );
  }
}
