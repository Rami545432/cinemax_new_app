import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/favorite/domain/repos/favorite_repo.dart';

@lazySingleton
class PullCloudFavoritesUseCase {
  final FavoriteRepo repository;

  PullCloudFavoritesUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String userId) =>
      repository.pullCloudFavorites(userId);
}
