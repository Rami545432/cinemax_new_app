import 'package:dartz/dartz.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/features/favorite/domain/entities/favorite_entity.dart';
import 'package:movify/features/favorite/domain/repos/favorite_repo.dart';

class AddFavoriteUseCase {
  final FavoriteRepo repository;

  AddFavoriteUseCase(this.repository);

  Future<Either<Failure, Unit>> call(FavoriteEntity favorite) =>
      repository.addFavorite(favorite);
}
