import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EpisodeInfoColumn extends StatelessWidget {
  const EpisodeInfoColumn({
    super.key,
    required this.episodeName,
    required this.episodeDuration,
    required this.episodeNumber,
  });
  final String episodeName;
  final num episodeDuration, episodeNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            episodeName,
            style: AppStyles.textStyle14(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          "${episodeDuration.toString()} Min",
          style: AppStyles.textStyle12(context),
        ),
        const SizedBox(height: 4),
        Text(
          'Episode $episodeNumber',
          style: AppStyles.textStyle14(
            context,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
