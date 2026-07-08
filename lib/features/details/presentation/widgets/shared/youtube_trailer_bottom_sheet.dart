import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeTrailerBottomSheet extends StatefulWidget {
  const YoutubeTrailerBottomSheet({super.key, required this.videoKey});

  final String videoKey;

  @override
  State<YoutubeTrailerBottomSheet> createState() =>
      _YoutubeTrailerBottomSheetState();
}

class _YoutubeTrailerBottomSheetState extends State<YoutubeTrailerBottomSheet> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      autoPlay: true,
      videoId: widget.videoKey,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.zero,
    child: YoutubePlayer(controller: _controller),
  );
}
