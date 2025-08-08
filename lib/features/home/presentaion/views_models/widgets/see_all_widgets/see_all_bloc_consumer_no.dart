// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../../core/utils/app_colors.dart';
// import '../../../../../../core/utils/cubits/gener_cubit/gener_cubit.dart';
// import '../../../manger/fetch_popular_movie_cubit/fetch_popular_movies_cubit.dart';
// import 'see_all_custom_scroll_view.dart';

// class SeeAllBLocConsumer extends StatelessWidget {
//   const SeeAllBLocConsumer({
//     super.key,
//     required ScrollController scrollController,
//   }) : _scrollController = scrollController;

//   final ScrollController _scrollController;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<FetchPopularMoviesCubit, FetchPopularMoviesState>(
//       listener: (context, state) {
//         if (state is FetchPopularMovieSuccess) {
//           final movies =
//               BlocProvider.of<GenerCubit>(context).getMoviesForSelectedGenre();

//           if (movies.isEmpty) {
//             movies.clear();
//           }
//           for (var movie in state.movies) {
//             if (!movies.contains(movie)) {
//               final selectedIndex = BlocProvider.of<GenerCubit>(context).state;

//               BlocProvider.of<GenerCubit>(context)
//                   .addMoviesToGenre(selectedIndex, movie);
//             }
//           }
//         }
//       },
//       builder: (context, state) {
//         final movies =
//             BlocProvider.of<GenerCubit>(context).getMoviesForSelectedGenre();
//         if (state is FetchPopularMovieSuccess ||
//             state is FetchPopularMoviesPaginationLoading) {
//           return SeeAllCustomScrollView(
//               scrollController: _scrollController, movies: movies);
//         }
//         return Center(
//           child: CircularProgressIndicator(
//             color: AppPrimaryColors.blueAccent,
//           ),
//         );
//       },
//     );
//   }
// }
