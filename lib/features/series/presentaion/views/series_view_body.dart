import 'package:cinemax_app_new/features/series/presentaion/manger/fetch_airing_today_cubit/fetch_airing_today_cubit.dart';
import 'package:cinemax_app_new/features/series/presentaion/widgets/generic_horizental_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/helper/generic_pagination_bloc_builder.dart';
import '../../../search/presentaion/view_models/widgets/search_bar_button.dart';
import '../manger/fetch_popular_tv_shows_cubit/fetch_popular_tv_shows_cubit.dart';
import '../manger/fetch_top_rated_tv_shows_cubit/fetch_top_rated_tv_shows_cubit.dart';
import '../manger/fetch_trending_tv_show_cubit/fetch_trending_tv_show_cubit.dart';

class SeriesViewBody extends StatelessWidget {
  const SeriesViewBody({super.key});
  static const List<Widget> _widgets = [
    SearchBarButton(),
    SizedBox(height: 8),
    GenericHorizontalCard<FetchTrendingTvShowCubit>(),
    SizedBox(height: 24),
    GenericPaginationBlocBuilder<FetchPopularTvShowsCubit>(
      title: 'POPULAR',
      type: 'tv',
    ),
    SizedBox(height: 24),
    GenericPaginationBlocBuilder<FetchTopRatedTvShowsCubit>(
      title: 'TOP RATED',
      type: 'tv',
    ),
    SizedBox(height: 24),
    GenericPaginationBlocBuilder<FetchAiringTodayCubit>(
      title: 'AIRING TODAY',
      type: 'tv',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [SliverList(delegate: SliverChildListDelegate(_widgets))],
    );
  }
}
