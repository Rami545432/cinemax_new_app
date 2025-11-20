import 'package:cinemax_app_new/features/details/data/models/arguments/season_view_argument.dart';
import 'package:cinemax_app_new/features/details/presentation/cubits/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:cinemax_app_new/features/details/presentation/views/season_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
    int season = widget.seasonViewArgument.seasonNumber ?? 0;
    BlocProvider.of<FetchSeriesSeasonDetailsCubit>(
      context,
    ).fetchSeriesSeasonDetail(tvid: tvid, season: season);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: widget.seasonViewArgument,
        child: SeasonBody(),
      ),
    );
  }
}
