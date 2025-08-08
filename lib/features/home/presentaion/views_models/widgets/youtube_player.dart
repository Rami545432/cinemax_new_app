import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../domian/entites/movie_details_entity.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  const YoutubeVideoPlayer({super.key, required this.movieDetailsEntity});
  final MovieDetailsEntity? movieDetailsEntity;
  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId:
          // Result.getTrailerKey(widget.movieDetailsEntity.).toString(),
          'oarv3J2Hmro',
      flags: const YoutubePlayerFlags(hideThumbnail: true, autoPlay: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubePlayerController,
        onEnded: (metaData) {
          GoRouter.of(context).pop();
        },
      ),
      builder: (context, player) {
        return player;
      },
    );
  }
}
