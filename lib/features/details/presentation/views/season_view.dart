import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:movify/features/details/presentation/views/season_view_body.dart';
import 'package:provider/provider.dart';

class SeasonView extends StatefulWidget {
  const SeasonView({super.key, required this.seasonDataNav});
  final SeasonNavData seasonDataNav;
  @override
  State<SeasonView> createState() => _SeasonViewState();
}

class _SeasonViewState extends State<SeasonView> {
  @override
  void initState() {
    final int tvid = widget.seasonDataNav.tmdbId;
    final int season = widget.seasonDataNav.seasonNumber;
    BlocProvider.of<FetchSeriesSeasonDetailsCubit>(
      context,
    ).fetchSeriesSeasonDetail(tvid: tvid, season: season);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Provider.value(
      value: widget.seasonDataNav,
      child: const SeasonViewBody(),
    ),
  );
}
