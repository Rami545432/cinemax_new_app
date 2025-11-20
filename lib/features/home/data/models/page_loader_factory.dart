import 'package:cinemax_app_new/core/utils/get_it.dart';
import 'package:cinemax_app_new/core/utils/helper/base_pagination_cubit/base_paginated_cubit.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../series/data/repos/series_repo_impl.dart';
import '../repos/home_repo_impl.dart';

class PageLoaderFactory {
  static PageLoader<BaseCardModel, NoParams> createPageLoader({
    required String type,
    required String title,
  }) {
    switch (type) {
      case 'movie':
        return _createPageLoaderForMovie(title: title);
      case 'tv':
        return _createPageLoaderForTv(title: title);
      default:
        return _createDefaultPageLoader();
    }
  }

  static PageLoader<BaseCardModel, NoParams> _createDefaultPageLoader() {
    return ({
      required NoParams params,
      int? page,
      CancelToken? cancelToken,
    }) async {
      return Right([]);
    };
  }

  static PageLoader<BaseCardModel, NoParams> _createPageLoaderForMovie({
    required String title,
  }) {
    final homeRepo = getIt<HomeRepoImpl>();
    return ({NoParams? params, int? page, CancelToken? cancelToken}) async {
      switch (title) {
        case 'NOW PLAYING':
          return await homeRepo.fetchNowPlayingMovies(
            page: page!,
            cancelToken: cancelToken,
          );
        case 'POPULAR':
          return await homeRepo.fetchPopularMovies(
            '',
            page: page!,
            cancelToken: cancelToken,
          );
        case 'TOP RATED':
          return await homeRepo.fetchTopRatedMovies(
            page: page!,
            cancelToken: cancelToken,
          );
        case 'UPCOMING':
          return await homeRepo.fetchUpcomingMovies(
            page: page!,
            cancelToken: cancelToken,
          );
        default:
          throw Exception('Invalid title');
      }
    };
  }

  static PageLoader<BaseCardModel, NoParams> _createPageLoaderForTv({
    required String title,
  }) {
    final seriesRepo = getIt<SeriesRepoImpl>();
    return ({NoParams? params, int? page, CancelToken? cancelToken}) async {
      switch (title) {
        case 'POPULAR':
          return await seriesRepo.fetchPopularTvShows(
            '',
            page: page!,
            cancelToken: cancelToken,
          );
        case 'TOP RATED':
          return await seriesRepo.fetchTopRatedTvShows(
            page: page!,
            cancelToken: cancelToken,
          );
        case 'AIRING TODAY':
          return await seriesRepo.fetchTvAiringToday(
            page: page!,
            cancelToken: cancelToken,
          );
        default:
          throw Exception('Invalid title');
      }
    };
  }
}
