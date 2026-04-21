import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/icon_text_row.dart';
import 'package:flutter/material.dart';

class EpisodeMobilePlayButton extends StatelessWidget {
  const EpisodeMobilePlayButton({super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 6,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppPrimaryColors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: IconTextRow(
          iconData: Icons.play_arrow_rounded,
          text: 'Play ',
          color: Colors.white,
        ),
      ),
    ),
  );
}
