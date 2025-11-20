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
// import 'package:cinemax_app_new/features/home/presentation/views_models/widgets/main_vertical_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CategoryFullListScreen extends StatefulWidget {
//   final MovieCategory category;

//   const CategoryFullListScreen({super.key, required this.category});

//   @override
//   State<CategoryFullListScreen> createState() => _CategoryFullListScreenState();
// }

// class _CategoryFullListScreenState extends State<CategoryFullListScreen> {
//   late ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _scrollController.addListener(_onScroll);
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels >=
//         _scrollController.position.maxScrollExtent * 0.9) {
//       context.read<HomeViewCubit>().loadNextPage(widget.category, null);
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeViewCubit(
//         fetchTrendingMovieUseCase: FetchTrendingMoviesUseCase(
//           homeRepo: getIt.get<HomeRepoImpl>(),
//         ),
//         fetchPopularUseCase: FetchPopularUseCase(
//           homeRepo: getIt.get<HomeRepoImpl>(),
//         ),
//         fetchUpcomingMovieCase: FetchUpcomingMovieCase(
//           homeRepo: getIt.get<HomeRepoImpl>(),
//         ),
//         fetchNowPlayingUseCase: FetchNowPlayingUseCase(
//           homeRepo: getIt.get<HomeRepoImpl>(),
//         ),
//         fetchTopRatedUseCase: FetchTopRatedMoviesUseCase(
//           homeRepo: getIt.get<HomeRepoImpl>(),
//         ),
//       )..loadCategory(widget.category, null),
//       child: Scaffold(
//         appBar: AppBar(title: Text(widget.category.name)),
//         body: BlocBuilder<HomeViewCubit, HomeViewState>(
//           builder: (context, state) {
//             if (state is! HomeViewLoaded) {
//               return Center(child: CircularProgressIndicator());
//             }

//             final items = state.getItems(widget.category);
//             final isLoading = state.isLoading(widget.category);
//             final canLoadMore = state.canLoadMore(widget.category);

//             return GridView.builder(
//               controller: _scrollController,
//               padding: EdgeInsets.all(16),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 0.7,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               itemCount: items.length + (canLoadMore || isLoading ? 1 : 0),
//               itemBuilder: (context, index) {
//                 if (index == items.length) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 return MainVerticalCard(cardModel: items[index]);
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
