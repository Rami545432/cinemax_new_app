import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends HookWidget {
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
    final isPressed = useState(false);
    final shareParams = useMemoized(
      () => ShareParams(
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
      [contentType, id, seasonNumber, episodeNumber],
    );
    return GestureDetector(
      onTap: () async {
        isPressed.value = true;
        await SharePlus.instance.share(shareParams);
        isPressed.value = false;
      },
      child: AnimatedRotation(
        turns: isPressed.value ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: isPressed.value
            ? const Icon(Icons.share_rounded)
            : const Icon(Icons.share_rounded),
      ),
    );
  }
}
