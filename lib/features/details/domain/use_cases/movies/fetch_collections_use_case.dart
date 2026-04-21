import 'package:cinemax_app_new/core/types/domain_types.dart';
import 'package:cinemax_app_new/features/details/domain/repo/movie_details_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchCollectionsUseCase {
  final MovieDetailsRepo movieDetailsRepo;
  FetchCollectionsUseCase({required this.movieDetailsRepo});
  CollectionResult call([int? collectionId]) =>
      movieDetailsRepo.fetchMovieCollections(collectionId!);
}
