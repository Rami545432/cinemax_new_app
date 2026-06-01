import 'package:movify/core/types/domain_types.dart';
import 'package:movify/features/details/domain/repo/movie_details_repo.dart';

class FetchCollectionsUseCase {
  final MovieDetailsRepo movieDetailsRepo;
  FetchCollectionsUseCase({required this.movieDetailsRepo});
  CollectionResult call([int? collectionId]) =>
      movieDetailsRepo.fetchMovieCollections(collectionId!);
}
