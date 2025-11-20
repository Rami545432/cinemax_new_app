import 'package:cinemax_app_new/core/utils/cubit_parameters/airing_today_params.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/popular_params.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/top_rated_params.dart';
import 'package:cinemax_app_new/core/utils/cubit_parameters/trending_params.dart';
import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/pagination/cubit/category_pagination_cubit.dart';
import 'package:cinemax_app_new/core/utils/pagination/config/pagintaion_config.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_airing_today.use_case.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_popular_use_case.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_top_rated_use_case.dart';
import 'package:cinemax_app_new/features/series/domain/use_cases/fetch_tv_trending_use_case.dart';
import 'package:cinemax_app_new/features/series/presentation/cubit/seires_category.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SeriesViewCubit
    extends CategoryPaginationCubit<SeriesCategory, BaseCardModel, NoParams> {
  final FetchTrendingTvShowUseCase fetchTrendingTvShowUseCase;
  final FetchPopularTvShowsUseCase fetchPopularTvShowsUseCase;
  final FetchTopRatedTvShowsUseCase fetchTopRatedTvShowsUseCase;
  final FetchAiringTodayTvShowsUseCase fetchAiringTodayTvShowsUseCase;
  SeriesViewCubit({
    required this.fetchTrendingTvShowUseCase,
    required this.fetchPopularTvShowsUseCase,
    required this.fetchTopRatedTvShowsUseCase,
    required this.fetchAiringTodayTvShowsUseCase,
  }) : super(PaginationConfig(itemsPerPage: 20));
  @override
  List<SeriesCategory> get allCategories => SeriesCategory.values;
  @override
  Future<Either<Failure, List<BaseCardModel>>> fetchCategoryData(
    SeriesCategory category,
    int page,
    CancelToken? cancelToken,
  ) async {
    return switch (category) {
      SeriesCategory.trending => fetchTrendingTvShowUseCase.call(
        TrendingParams(type: 'tv'),
        page,
        cancelToken,
      ),
      SeriesCategory.popular => fetchPopularTvShowsUseCase.call(
        PopularParams(type: 'tv', sortBy: ''),
        page,
        cancelToken,
      ),
      SeriesCategory.airingToday => fetchAiringTodayTvShowsUseCase.call(
        AiringTodayParams(type: 'tv'),
        page,
        cancelToken,
      ),

      SeriesCategory.topRated => fetchTopRatedTvShowsUseCase.call(
        TopRatedParams(type: 'tv'),
        page,
        cancelToken,
      ),
    };
  }
}
