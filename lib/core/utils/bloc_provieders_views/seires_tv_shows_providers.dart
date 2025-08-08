import 'package:cinemax_app_new/features/series/presentaion/manger/fetch_series_season_details_cubit/fetch_series_season_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/series/data/repos/series_repo_impl.dart';
import '../../../features/series/domain/use_cases/fetch_series_season_details.dart';
import '../../../features/series/domain/use_cases/fetch_tv_airing_today.use_case.dart';
import '../../../features/series/domain/use_cases/fetch_tv_popular_use_case.dart';
import '../../../features/series/domain/use_cases/fetch_tv_top_rated_use_case.dart';
import '../../../features/series/domain/use_cases/fetch_tv_trending_use_case.dart';
import '../../../features/series/presentaion/manger/fetch_airing_today_cubit/fetch_airing_today_cubit.dart';
import '../../../features/series/presentaion/manger/fetch_popular_tv_shows_cubit/fetch_popular_tv_shows_cubit.dart';
import '../../../features/series/presentaion/manger/fetch_top_rated_tv_shows_cubit/fetch_top_rated_tv_shows_cubit.dart';
import '../../../features/series/presentaion/manger/fetch_trending_tv_show_cubit/fetch_trending_tv_show_cubit.dart';
import '../../../features/series/presentaion/views/series_view.dart';
import '../cubit_parameters/params.dart';
import '../get_it.dart';

class SeiresTvShowsProviders extends StatelessWidget {
  const SeiresTvShowsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchPopularTvShowsCubit(
                FetchPopularTvShowsUseCase(
                  seriesRepo: getIt.get<SeriesRepoImpl>(),
                ),
              )..fetchInitialData(
                params: PopularParams(type: 'tv', sortBy: ''),
              ),
        ),
        BlocProvider(
          create: (context) => FetchTopRatedTvShowsCubit(
            FetchTopRatedTvShowsUseCase(
              seriesRepo: getIt.get<SeriesRepoImpl>(),
            ),
          )..fetchInitialData(params: TopRatedParams(type: 'tv', page: 1)),
        ),
        BlocProvider(
          create: (context) => FetchTrendingTvShowCubit(
            FetchTreningTvShowsUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
          )..fetchInitialData(params: TrendingParams(type: 'tv', page: 1)),
        ),
        BlocProvider(
          create: (context) => FetchAiringTodayCubit(
            FetchTvAiringTodayUseCase(seriesRepo: getIt.get<SeriesRepoImpl>()),
          )..fetchInitialData(params: AiringTodayParams(type: 'tv', page: 1)),
        ),
        BlocProvider(
          create: (context) => FetchSeriesSeasonDetailsCubit(
            FetchSeriesSeasonDetailsUseCase(
              seriesRepo: getIt.get<SeriesRepoImpl>(),
            ),
          ),
        ),
      ],
      child: const SeriesView(),
    );
  }
}
