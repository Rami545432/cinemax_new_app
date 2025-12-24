import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/core/utils/use_case/use_case.dart';
import 'package:cinemax_app_new/features/details/domain/entites/collection_entity.dart';
import 'package:cinemax_app_new/features/details/domain/repo/details_repo.dart';
import 'package:dio/dio.dart';

class FetchCollectionsUseCase extends UseCase<CollectionEntity, int> {
  final DetailsRepo detailsRepo;
  FetchCollectionsUseCase({required this.detailsRepo});
  @override
  CollectionResult call([int? collectionId, CancelToken? cancelToken]) async {
    return await detailsRepo.fetchCollection(collectionId!, cancelToken);
  }
}
