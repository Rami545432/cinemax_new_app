import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/details/domain/enums/similar_category.dart';
import 'package:cinemax_app_new/features/details/domain/repo/details_repo.dart';
import 'package:cinemax_app_new/features/home/data/models/test_model.dart';
import 'package:cinemax_app_new/models/base_card_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchSimilarUseCase
    extends UseCase<PagedResult<BaseCardModel>, SimilarParams> {
  final DetailsRepo detailsRepo;
  FetchSimilarUseCase({required this.detailsRepo});
  @override
  Future<Either<Failure, PagedResult<BaseCardModel>>> call([
    SimilarParams? params,
    int? page,
    CancelToken? cancelToken,
    SimilarCategory? category,
  ]) async {
    return switch (category) {
      SimilarCategory.movie => await detailsRepo.fetchSimilarItems(
        params!.id,
        'movie',
        page!,
        cancelToken!,
      ),
      SimilarCategory.tv => await detailsRepo.fetchSimilarItems(
        params!.id,
        'tv',
        page!,
        cancelToken!,
      ),
      _ => throw Exception('Invalid category'),
    };
  }
}

class SimilarParams {
  final int id;
  SimilarParams({required this.id});
}
