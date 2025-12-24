import 'package:cinemax_app_new/core/utils/cubit_parameters/newest_params.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/now_playing_params.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/popular_params.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/top_rated_params.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/trending_params.dart';
import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/core/utils/pagination/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_upcoming_movies.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_now_playing_movie.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_popular_use_case.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_top_rated_movies.dart';
import 'package:cinemax_app_new/features/home/domian/uses_cases/fetch_trending_movie_use_case.dart';
import 'package:cinemax_app_new/features/home/presentation/cubit/movie_category.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MovieViewCubit
    extends CategoryPaginationCubit<MovieCategory, BaseCardModel, NoParams> {
  final FetchTrendingMoviesUseCase fetchTrendingMovieUseCase;
  final FetchPopularUseCase fetchPopularUseCase;
  final FetchUpcomingMovieCase fetchUpcomingMovieCase;
  final FetchNowPlayingUseCase fetchNowPlayingUseCase;
  final FetchTopRatedMoviesUseCase fetchTopRatedUseCase;
  MovieViewCubit({
    required this.fetchTrendingMovieUseCase,
    required this.fetchPopularUseCase,
    required this.fetchUpcomingMovieCase,
    required this.fetchNowPlayingUseCase,
    required this.fetchTopRatedUseCase,
  }) : super(PaginationConfig(itemsPerPage: 20));
  @override
  List<MovieCategory> get allCategories => MovieCategory.values;
  @override
  Future<Either<Failure, PagedResult<BaseCardModel>>> fetchCategoryData(
    MovieCategory category,
    int page,
    NoParams? params,
    CancelToken? cancelToken,
  ) async {
    return switch (category) {
      MovieCategory.trending => fetchTrendingMovieUseCase.call(
        TrendingParams(type: 'movie'),
        page,
        cancelToken,
      ),
      MovieCategory.popular => fetchPopularUseCase.call(
        PopularParams(type: 'movie', sortBy: ''),
        page,
        cancelToken,
      ),
      MovieCategory.upcoming => fetchUpcomingMovieCase.call(
        NewestParams(type: 'movie'),
        page,
        cancelToken,
      ),
      MovieCategory.nowPlaying => fetchNowPlayingUseCase.call(
        NowPlayingParams(type: 'movie'),
        page,
        cancelToken,
      ),
      MovieCategory.topRated => fetchTopRatedUseCase.call(
        TopRatedParams(type: 'movie'),
        page,
        cancelToken,
      ),
    };
  }
}
