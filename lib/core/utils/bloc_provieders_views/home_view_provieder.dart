import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/data/repos/home_repo_impl.dart';
import '../../../features/home/domian/uses_cases/fetch_popular_use_case.dart';
import '../../../features/home/domian/uses_cases/fetch_newst_movies.dart';
import '../../../features/home/domian/uses_cases/fetch_now_playing_movie.dart';
import '../../../features/home/domian/uses_cases/fetch_top_rated_movies.dart';
import '../../../features/home/domian/uses_cases/fetch_trending_movie.dart';
import '../../../features/home/presentaion/manger/fetch_newst_movies_cubit/fetch_upcoming_movies_cubit.dart';
import '../../../features/home/presentaion/manger/fetch_now_playing_movie_cubit/fetch_now_playing_movies_cubit.dart';
import '../../../features/home/presentaion/manger/fetch_popular_movie_cubit/fetch_popular_movies_cubit.dart';
import '../../../features/home/presentaion/manger/fetch_top_rated_movies_cubit/fetch_top_rated_movies_cubit.dart';
import '../../../features/home/presentaion/manger/fetch_trending_movie_cubit/fetch_trending_movie_cubit.dart';
import '../../../features/home/presentaion/views_models/views/home_view.dart';
import '../cubit_parameters/params.dart';
import '../get_it.dart';

class HomeViewProviders extends StatelessWidget {
  const HomeViewProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        _createFetchNewsetMoviesCubit(),
        _createFetchPopularMoviesCubit(),
        _createFetchTrendingMovieCubit(),
        _createFetchNowPlayingMoviesCubit(),
        _createFetchTopRatedMoviesCubit(),
      ],
      child: const HomeView(),
    );
  }

  BlocProvider<FetchUpcomingMoviesCubit> _createFetchNewsetMoviesCubit() {
    return BlocProvider(
      create: (context) => FetchUpcomingMoviesCubit(
        FetchNewstMovieCase(homeRepo: getIt.get<HomeRepoImpl>()),
      )..fetchInitialData(params: NewestParams(type: 'movie')),
    );
  }

  BlocProvider<FetchPopularMoviesCubit> _createFetchPopularMoviesCubit() {
    return BlocProvider(
      create: (context) =>
          FetchPopularMoviesCubit(
            FetchPopularUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
          )..fetchInitialData(
            params: PopularParams(type: 'movie', sortBy: ''),
          ),
    );
  }

  BlocProvider<FetchTrendingMovieCubit> _createFetchTrendingMovieCubit() {
    return BlocProvider(
      create: (context) => FetchTrendingMovieCubit(
        FetchTrendingMovieUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
      )..fetchInitialData(params: TrendingParams(type: 'movie')),
    );
  }

  BlocProvider<FetchNowPlayingMoviesCubit> _createFetchNowPlayingMoviesCubit() {
    return BlocProvider(
      create: (context) => FetchNowPlayingMoviesCubit(
        FetchNowPlayingMovieUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
      )..fetchInitialData(params: NowPlayingParams(type: 'movie')),
    );
  }

  BlocProvider<FetchTopRatedMoviesCubit> _createFetchTopRatedMoviesCubit() {
    return BlocProvider(
      create: (context) => FetchTopRatedMoviesCubit(
        FetchTopRatedMoviesUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
      )..fetchInitialData(params: TopRatedParams(type: 'movie')),
    );
  }
}
