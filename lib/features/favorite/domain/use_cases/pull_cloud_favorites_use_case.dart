import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/favorite/domain/repos/favorite_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PullCloudFavoritesUseCase {
  final FavoriteRepo repository;

  PullCloudFavoritesUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String userId) =>
      repository.pullCloudFavorites(userId);
}
