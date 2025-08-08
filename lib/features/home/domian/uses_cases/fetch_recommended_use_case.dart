import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/errors.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../../../../models/base_card_model.dart';
import '../repos/home_repo.dart';

class FetchRecommendedUseCase extends UseCase<List<BaseCardModel>, int> {
  final HomeRepo homeRepo;

  FetchRecommendedUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BaseCardModel>>> call([
    int? parameter,
    String? type,
    CancelToken? cancelToken,
  ]) async {
    return await homeRepo.fetchRecommmendedItems(
      parameter!,
      type!,
      cancelToken,
    );
  }
}
