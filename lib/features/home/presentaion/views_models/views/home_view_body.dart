import 'dart:developer';

import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/features/home/data/models/discover_model_list.dart';
import 'package:cinemax_app_new/features/home/presentaion/manger/fetch_newst_movies_cubit/fetch_upcoming_movies_cubit.dart';
import 'package:cinemax_app_new/features/home/presentaion/manger/fetch_trending_movie_cubit/fetch_trending_movie_cubit.dart';
import 'package:cinemax_app_new/features/home/presentaion/views_models/widgets/details_widgets/gener_box.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/animations/animated_button.dart';
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
    IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DiscoverWidget()),
        );
      },
      icon: Icon(Icons.add),
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            spacing: 150,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: AnimatedButton(
                  onPressed: () {
                    log('Discover Button 1 Pressed!');
                  },
                  entranceAnimation: ButtonAnimationType.bounce,
                  pressAnimation: ButtonAnimationType.ripple,
                  animationDuration: const Duration(seconds: 1),
                  entranceDelay: const Duration(seconds: 1),
                  autoAnimate: true,
                  child: Container(
                    // ← Custom styled container instead of ElevatedButton
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      'Discover 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedButton(
                onPressed: () {
                  log('Discover Button 2 Pressed!');
                },
                entranceAnimation: ButtonAnimationType.slideUp,
                pressAnimation: ButtonAnimationType.ripple,
                animationDuration: const Duration(seconds: 1),
                entranceDelay: const Duration(seconds: 2),
                autoAnimate: true,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Discover 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              AnimatedButton(
                onPressed: () {
                  log('Discover Button 3 Pressed!');
                },
                entranceAnimation: ButtonAnimationType.fade,
                pressAnimation: ButtonAnimationType.pulse,
                animationDuration: const Duration(seconds: 1),
                entranceDelay: const Duration(seconds: 3),
                autoAnimate: true,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Discover 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiscoverBox extends StatelessWidget {
  const DiscoverBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: discoverModelList[0].onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPrimaryColors.dark,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(discoverModelList[0].icon),
              Text(discoverModelList[0].title),
            ],
          ),
        ),
      ),
    );
  }
}
