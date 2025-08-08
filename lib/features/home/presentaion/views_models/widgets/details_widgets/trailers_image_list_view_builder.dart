import 'package:flutter/material.dart';

import 'trailer_thumbnail.dart';
import 'youtube_trailer_player_dialog.dart';

class TrailersImageListViewBuilder extends StatelessWidget {
  const TrailersImageListViewBuilder({super.key, required this.videoKey});
  final List<String?> videoKey;
  @override
  Widget build(BuildContext context) {
    if (videoKey.isEmpty) {
      return const Center(
        child: Text('No Trailers', style: TextStyle(color: Colors.white)),
      );
    }
    return AspectRatio(
      aspectRatio: 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videoKey.length,
        itemBuilder: (context, index) {
          return TrailerThumbnail(
            videoKey: videoKey[index]!,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return YoutubeTrailerPlayerDialog(
                    videoKey: videoKey[index] ?? '',
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
