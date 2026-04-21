import 'dart:developer';

import 'package:cinemax_app_new/features/details/presentation/core/details_data_navigation.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_state.dart';
import 'package:cinemax_app_new/features/details/presentation/views/episode_body.dart'
    show EpisodeBody;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodeView extends StatefulWidget {
  const EpisodeView({super.key, required this.episodeDataNav});
  final EpisodeNavData episodeDataNav;

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends State<EpisodeView> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<FetchSeriesSeasonDetailsCubit>(context);
    log(widget.episodeDataNav.tmdbId.toString());
    log(widget.episodeDataNav.specificId.toString());

    final int tvid = widget.episodeDataNav.tmdbId;
    final int season = widget.episodeDataNav.seasonNumber;
    cubit.fetchSeriesSeasonDetail(tvid: tvid, season: season);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body:
        BlocBuilder<
          FetchSeriesSeasonDetailsCubit,
          FetchSeriesSeasonDetailsState
        >(
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.cyanAccent),
            ),
            failure: (message) => Center(child: Text(message ?? '')),
            success: (series) => EpisodeBody(
              episodeNumber: widget.episodeDataNav.episodeNumber,
              seasonPosterPath: widget.episodeDataNav.posterImage,
              seriesBackUpImage: widget.episodeDataNav.seriesPosterPath ?? '',
              allEpisodes: series.seasonEpisodes,
            ),
          ),
        ),
  );
}
