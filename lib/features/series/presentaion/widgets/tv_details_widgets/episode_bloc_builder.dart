// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../manger/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
// import 'episode_card_list_view_builder.dart';
// import 'episode_loading_widgets/episode_card_list_view_loading.dart';

// class EpisodeCardBlocBuilder extends StatelessWidget {
//   const EpisodeCardBlocBuilder({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<FetchSeriesSeasonDetailsCubit,
//         FetchSeriesSeasonDetailsState>(listener: (context, state) {

//           if (state is FetchSeriesSeasonDetailsSuccess){
//             if(state.seasons.length<=50){

//             }
//           }
//         },
//       builder: (context, state) {
//         if (state is FetchSeriesSeasonDetailsSuccess) {
//           return EpisodeCardListViewBuilder(
//             seasons: state.seasons,
//           );
//         }
//         if (state is FetchSeriesSeasonDetailsFailure) {
//           return Text(state.errorMessage);
//         }
//         return EpisodeCardListViewBuilderLoading();
//       },
//     );
//   }
// }
