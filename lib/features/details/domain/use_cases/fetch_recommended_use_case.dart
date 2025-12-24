import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/details/domain/enums/recomended_category.dart';
import 'package:cinemax_app_new/features/details/domain/repo/details_repo.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchRecommendedUseCase
    extends UseCase<PagedResult<BaseCardModel>, RecomendedParams> {
  final DetailsRepo detailsRepo;
  FetchRecommendedUseCase({required this.detailsRepo});
  @override
  Future<Either<Failure, PagedResult<BaseCardModel>>> call([
    RecomendedParams? params,
    int? page,
    CancelToken? cancelToken,
    RecomendedCategory? category,
  ]) async {
    return switch (category!) {
      RecomendedCategory.movie => await detailsRepo.fetchRecommendations(
        params!.id,
        'movie',
        page,
        cancelToken,
      ),
      RecomendedCategory.tv => await detailsRepo.fetchRecommendations(
        params!.id,
        'tv',
        page,
        cancelToken,
      ),
    };
  }
}

class RecomendedParams {
  final int id;

  RecomendedParams({required this.id});
}
