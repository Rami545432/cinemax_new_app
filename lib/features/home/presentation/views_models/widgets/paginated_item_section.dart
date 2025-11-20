// import 'package:cinemax_app_new/core/types/home_view_types.dart';
// import 'package:cinemax_app_new/core/utils/get_it.dart';
// import 'package:cinemax_app_new/features/home/data/repos/home_repo_impl.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_upcoming_movies.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_now_playing_movie.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_popular_use_case.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_top_rated_movies.dart';
// import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_trending_movie_use_case.dart';
// import 'package:cinemax_app_new/features/home/presentation/cubit/home_view_cubit.dart';
// import 'package:cinemax_app_new/features/home/presentation/cubit/movie_category.dart';
// import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/category_full_list_screen.dart';
// import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/paginated_item_list_view_builder.dart';
// import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/section_header.dart';
// import 'package:cinemax_app_new/models/base_card_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PaginatedItemSection extends StatelessWidget {
//   final MovieCategory category;

//   const PaginatedItemSection({super.key, required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeViewCubit, HomeViewState>(
//       buildWhen: (previous, current) {
//         // Only rebuild if THIS category's data changed
//         if (previous is HomeViewLoaded && current is HomeViewLoaded) {
//           return previous.getPaginationInfo(category) !=
//               current.getPaginationInfo(category);
//         }
//         return true;
//       },
//       builder: (context, state) {
//         if (state is! HomeViewLoaded) {
//           return SizedBox.shrink();
//         }

//         final items = state.getItems(category);
//         final isLoading = state.isLoading(category);
//         final isInitialLoad = state.isInitialLoad(category);
//         final canLoadMore = state.canLoadMore(category);
//         final error = state.getError(category);

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SectionHeader<HomeViewCubit, MovieCategory, BaseCardModel, void>(
//               category: category,
//               title: category.name,
//               isLoading: isLoading,
//               isInitialLoad: isInitialLoad,
//             ),

//             // Initial Loading
//             if (isInitialLoad && isLoading)
//               Container(
//                 height: 200,
//                 alignment: Alignment.center,
//                 child: CircularProgressIndicator(),
//               ),

//             // Error Message
//             if (error != null && items.isEmpty)
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Text(error, style: TextStyle(color: Colors.red)),
//                     SizedBox(height: 8),
//                     ElevatedButton(
//                       onPressed: () => context
//                           .read<HomeViewCubit>()
//                           .loadCategory(category, null),
//                       child: Text('Retry'),
//                     ),
//                   ],
//                 ),
//               ),

//             // Movies List with Pagination
//             if (items.isNotEmpty)
//               NotificationListener<ScrollNotification>(
//                 onNotification: (scrollInfo) {
//                   // Load more when near end
//                   if (scrollInfo.metrics.pixels >=
//                       scrollInfo.metrics.maxScrollExtent * 0.8) {
//                     context.read<HomeViewCubit>().loadNextPage(category, null);
//                   }
//                   return false;
//                 },
//                 child: PaginatedItemListViewBuilder(
//                   items: items,
//                   canLoadMore: canLoadMore,
//                 ),
//               ),

//             // "See All" button (optional)
//             if (items.isNotEmpty)
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 child: TextButton(
//                   onPressed: () {
//                     // Navigate to full list screen with pagination
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => BlocProvider(
//                           create: (context) => HomeViewCubit(
//                             fetchTrendingMovieUseCase:
//                                 FetchTrendingMoviesUseCase(
//                                   homeRepo: getIt.get<HomeRepoImpl>(),
//                                 ),
//                             fetchPopularUseCase: FetchPopularUseCase(
//                               homeRepo: getIt.get<HomeRepoImpl>(),
//                             ),
//                             fetchUpcomingMovieCase: FetchUpcomingMovieCase(
//                               homeRepo: getIt.get<HomeRepoImpl>(),
//                             ),
//                             fetchNowPlayingUseCase: FetchNowPlayingUseCase(
//                               homeRepo: getIt.get<HomeRepoImpl>(),
//                             ),
//                             fetchTopRatedUseCase: FetchTopRatedMoviesUseCase(
//                               homeRepo: getIt.get<HomeRepoImpl>(),
//                             ),
//                           )..loadCategory(category, null),
//                           child: CategoryFullListScreen(category: category),
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text('See All →'),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
