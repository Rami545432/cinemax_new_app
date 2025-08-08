// import 'package:cinemax_app/features/home/data/models/movie_details_model/videos.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../manger/fetch_movie_details_cubit/fetch_movie_details_cubit.dart';

// class TrailersBLocSelector extends StatelessWidget {
//   const TrailersBLocSelector({
//     super.key, required this.videos,
//   });
// final Videos videos;
//   // ignore: prefer_const_constructors_in_immutable
//   @override
//   Widget build(BuildContext context) {
//     return BlocSelector<FetchDetailsCubit, FetchDetailsState,
//         List<String?>>(
//       selector: (state) {
//         if (state is FetchDetailsSuccess) {
//           if (type=='movie') {
//   return state.movieDetailsEntity!.kVideos!.results!
//       .map((keys) {
//     return keys.key;
//   }).toList();
// }
// else if (type=='tv'){
//   return state.seriesDetailsEntity!.kVideos!.results!
//      .map((keys) {
//     return keys.key;
//   }).toList();
// }
//         }

//         return [];
//       },
//       builder: (context, key) {

//       },
//     );
//   }
// }
