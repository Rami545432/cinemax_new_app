import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/search/presentation/widgets/icon_text_row.dart';
import 'package:cinemax_app_new/shared/presentation/widgets/in_app_view.dart';
import 'package:flutter/material.dart';

class MobilePlayButton extends StatelessWidget {
  const MobilePlayButton({
    super.key,
    required this.type,
    required this.id,
    this.seasonNumber,
    this.episodeNumber,
    required this.title,
  });
  final String type;
  final String id;
  final int? seasonNumber;
  final int? episodeNumber;
  final String title;

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 3,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute(
            builder: (context) => CustomInappView(
              movieOrTvUrl: type == 'movie'
                  ? 'https://vidsrc.me/embed/movie?tmdb=$id'
                  : 'https://vidsrc.me/embed/tv?tmdb=$id&season=$seasonNumber&episode=$episodeNumber',
              title: title,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPrimaryColors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
