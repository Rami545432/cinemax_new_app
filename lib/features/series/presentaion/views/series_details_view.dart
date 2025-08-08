// import 'package:cinemax_app/features/seires/presentaion/manger/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
// import 'package:cinemax_app/features/seires/presentaion/manger/fetch_tv_show_details_cubit/fetch_tv_show_details_cubit.dart';
// import 'package:cinemax_app/features/seires/presentaion/views/series_details_body.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SeriesDetailsView extends StatefulWidget {
//   const SeriesDetailsView({super.key, required this.tvId});
//   final int tvId;

//   @override
//   State<SeriesDetailsView> createState() => _SeriesDetailsViewState();
// }

// class _SeriesDetailsViewState extends State<SeriesDetailsView> {
//   @override
//   void initState() {
//     BlocProvider.of<FetchTvShowDetailsCubit>(context)
//         .fetchTvShowDetail(widget.tvId);
//     BlocProvider.of<FetchSeriesSeasonDetailsCubit>(context)
//         .fetchSeriesSeasonDetail(tvid: widget.tvId, season: 1);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SeriesDetailsBody(),
//     );
//   }
// }
