import 'package:flutter/material.dart';

import '../../data/models/series_season_details/episode.dart';
import 'episode_body.dart' show EpisodeBody;

class EpisodeView extends StatelessWidget {
  const EpisodeView({
    super.key,
    required this.episode,
    required this.imageUrl,
    required this.allEpisodes,
  });
  final Episode episode;
  final String imageUrl;
  final List<Episode> allEpisodes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EpisodeBody(
        episode: episode,
        imageUrl: imageUrl,
        allEpisodes: allEpisodes,
      ),
    );
  }
}
