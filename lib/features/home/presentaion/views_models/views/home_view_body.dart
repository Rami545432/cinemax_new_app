import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/home/data/models/discover_model_list.dart';
import 'package:cinemax_app_new/features/home/presentaion/manger/fetch_newst_movies_cubit/fetch_upcoming_movies_cubit.dart';
import 'package:cinemax_app_new/features/home/presentaion/manger/fetch_trending_movie_cubit/fetch_trending_movie_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/helper/generic_pagination_bloc_builder.dart';
import '../../../../../core/utils/sub_bar.dart';
import '../../../../search/presentaion/view_models/widgets/search_bar_button.dart';
import '../../../../series/presentaion/widgets/generic_horizental_card.dart';
import '../../manger/fetch_now_playing_movie_cubit/fetch_now_playing_movies_cubit.dart';
import '../../manger/fetch_popular_movie_cubit/fetch_popular_movies_cubit.dart';
import '../../manger/fetch_top_rated_movies_cubit/fetch_top_rated_movies_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static List<Widget> _widgets(BuildContext context) => [
    SearchBarButton(),
    SizedBox(height: 8),

    GenericHorizontalCard<FetchTrendingMovieCubit>(),
    SizedBox(height: 24),
    GenericPaginationBlocBuilder<FetchPopularMoviesCubit>(
      title: 'POPULAR',
      type: 'movie',
    ),
    SizedBox(height: 24),
    GenericPaginationBlocBuilder<FetchUpcomingMoviesCubit>(
      title: 'UPCOMING',
      type: 'movie',
    ),
    SizedBox(height: 24),
    GenericPaginationBlocBuilder<FetchNowPlayingMoviesCubit>(
      title: 'NOW PLAYING',
      type: 'movie',
    ),
    SizedBox(height: 24),
    GenericPaginationBlocBuilder<FetchTopRatedMoviesCubit>(
      title: 'TOP RATED',
      type: 'movie',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverList(delegate: SliverChildListDelegate(_widgets(context))),
      ],
    );
  }
}

class DiscoverWidget extends StatelessWidget {
  const DiscoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubBar(title: 'Discover'),
        ListView.builder(
          itemCount: discoverModelList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: discoverModelList[index].onTap,
              child: Container(
                decoration: BoxDecoration(color: AppPrimaryColors.soft),
                child: Row(
                  children: [
                    Icon(discoverModelList[index].icon),
                    Text(discoverModelList[index].title),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
