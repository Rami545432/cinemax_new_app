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
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoKey,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(),
      child: YoutubePlayer(
        controller: _controller,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),
          RemainingDuration(),
          FullScreenButton(),
        ],

        onEnded: (metaData) {
          Navigator.of(context).maybePop();
        },
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
    );
  }
}
