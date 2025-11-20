import 'package:cinemax_app_new/core/utils/animations/animated_button.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.contentType,
    required this.id,
    this.seasonNumber,
    this.episodeNumber,
  });

  final ContentType contentType;
  final int id;
  final int? seasonNumber;
  final int? episodeNumber;
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      entranceAnimation: ButtonAnimationType.scale,
      pressAnimation: ButtonAnimationType.ripple,
      entranceDelay: const Duration(seconds: 1),
      animationDuration: const Duration(seconds: 1),
      autoAnimate: true,
      onPressed: () => SharePlus.instance.share(
        ShareParams(
          subject: 'Share this ${contentType.text}',
          text: switch (contentType) {
            ContentType.movies => 'https://www.themoviedb.org/movie/$id',
            ContentType.series => 'https://www.themoviedb.org/tv/$id',
            ContentType.seasons =>
              'https://www.themoviedb.org/tv/$id/season/$seasonNumber',
            ContentType.episodes =>
              'https://www.themoviedb.org/tv/$id/season/$seasonNumber/episode/$episodeNumber',
          },
        ),
      ),
      child: const Icon(Icons.share_rounded),
    );
  }
}
