import 'package:flutter/material.dart';

import '../../features/search/presentaion/view_models/widgets/icon_text_row.dart';
import 'app_colors.dart';
import 'in_app_view.dart';

class TabletPlayButton extends StatelessWidget {
  const TabletPlayButton({
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
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomInappView(
                movieOrTvUrl: type == 'movie'
                    ? 'https://vidsrc.xyz/embed/movie?tmdb=$id'
                    : 'https://vidsrc.xyz/embed/tv?tmdb=$id&season=$seasonNumber&episode=$episodeNumber',
                title: title,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPrimaryColors.blueAccent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 100),

          child: Center(
            child: IconTextRow(
              iconData: Icons.play_arrow_rounded,
              text: 'Play ',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
