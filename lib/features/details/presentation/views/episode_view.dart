import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/arguments/episode_view_argument.dart';
import '../cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import '../cubits/fetch_series_season_details_cubit/fetch_series_season_details_state.dart';
import 'episode_body.dart' show EpisodeBody;

class EpisodeView extends StatefulWidget {
  const EpisodeView({super.key, required this.episodeViewArgument});
  final EpisodeViewArgument episodeViewArgument;

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends State<EpisodeView> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<FetchSeriesSeasonDetailsCubit>(context);

    if (widget.episodeViewArgument.preloadedSeasonDetails != null) {
      cubit.emitPreloadedData(
        widget.episodeViewArgument.preloadedSeasonDetails!,
      );
    } else {
      int tvid = widget.episodeViewArgument.tvid;
      int season = widget.episodeViewArgument.seasonNumber;
      cubit.fetchSeriesSeasonDetail(tvid: tvid, season: season);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<
            FetchSeriesSeasonDetailsCubit,
            FetchSeriesSeasonDetailsState
          >(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: Colors.cyanAccent),
                ),
                failure: (message) => Center(child: Text(message ?? '')),
                success: (series) => EpisodeBody(
                  episodeNumber: widget.episodeViewArgument.episodeNumber,
                  seasonPosterPath: widget.episodeViewArgument.seasonPosterPath,
                  seriesBackUpImage:
                      widget.episodeViewArgument.seiresPosterPath ?? '',
                  allEpisodes: series.seasonEpisodes,
                ),
              );
            },
          ),
    );
  }
}
