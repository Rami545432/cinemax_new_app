import 'package:cinemax_app_new/features/home/presentaion/views_models/widgets/details_widgets/season_view_argument.dart';
import 'package:cinemax_app_new/features/series/data/models/series_details_model/season.dart';
import 'package:cinemax_app_new/features/series/presentaion/manger/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:cinemax_app_new/features/series/presentaion/views/season_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeasonView extends StatefulWidget {
  const SeasonView({super.key, required this.seasonViewArgument});
  final SeasonViewArgument seasonViewArgument;

  @override
  State<SeasonView> createState() => _SeasonViewState();
}

class _SeasonViewState extends State<SeasonView> {
  @override
  void initState() {
    int tvid = widget.seasonViewArgument.id;
    Season season = widget.seasonViewArgument.season;
    BlocProvider.of<FetchSeriesSeasonDetailsCubit>(
      context,
    ).fetchSeriesSeasonDetail(tvid: tvid, season: season.seasonNumber ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SeasonBody(seasonViewArgument: widget.seasonViewArgument),
    );
  }
}
