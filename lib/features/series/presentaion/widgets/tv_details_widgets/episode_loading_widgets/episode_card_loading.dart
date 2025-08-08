import 'package:cinemax_app_new/features/series/presentaion/widgets/tv_details_widgets/episode_loading_widgets/episode_componets_loading.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class EpisodeCardLoading extends StatelessWidget {
  const EpisodeCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: null,
      width: 327,
      decoration: BoxDecoration(
        color: AppPrimaryColors.soft,
        borderRadius: BorderRadius.circular(16),
      ),
      child: EpisodeComponetsLoading(),
    );
  }
}
