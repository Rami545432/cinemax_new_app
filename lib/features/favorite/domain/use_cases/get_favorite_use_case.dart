import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';
import 'package:movify/features/favorite/domain/repos/favorite_repo.dart';

class GetFavoritesUseCase {
  final FavoriteRepo repository;

  GetFavoritesUseCase(this.repository);

  Future<Either<Failure, List<FavoriteEntity>>> call({
    required String userId,
    ContentType? contentType,
  }) => repository.getFavorites(userId: userId, contentType: contentType);
}
