import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/favorite/domain/repos/favorite_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MergeGuestFavoritesUseCase {
  final FavoriteRepo repository;

  MergeGuestFavoritesUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String newUserId) =>
      repository.mergeGuestFavorites(newUserId);
}
