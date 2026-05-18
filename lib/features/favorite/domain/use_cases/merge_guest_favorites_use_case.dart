import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/favorite/domain/repos/favorite_repo.dart';

@lazySingleton
class MergeGuestFavoritesUseCase {
  final FavoriteRepo repository;

  MergeGuestFavoritesUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String newUserId) =>
      repository.mergeGuestFavorites(newUserId);
}
