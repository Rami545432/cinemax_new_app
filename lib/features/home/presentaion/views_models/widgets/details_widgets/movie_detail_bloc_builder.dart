// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../manger/fetch_movie_details_cubit/fetch_movie_details_cubit.dart';
// import 'movie_details_list_view_componets.dart';

// class MovieDetailsBlocBuilder extends StatelessWidget {
//   const MovieDetailsBlocBuilder({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FetchMovieDetailsCubit, FetchMovieDetailsState>(
//       builder: (context, state) {
//         if (state is FetchMovieDetailsSuccess) {
//           return MovieDetailsListViewCompontes(
//             movieDetailsEntity: state.detailsModel,
//           );
//         }
//         if (state is FetchMovieDetailsFauilure) {
//           Text(state.errorMessage);
//         }
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
