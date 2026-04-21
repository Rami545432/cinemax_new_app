import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/features/favorite/domain/repos/favorite_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddFavoriteUseCase {
  final FavoriteRepo repository;

  AddFavoriteUseCase(this.repository);

  Future<Either<Failure, Unit>> call(FavoriteEntity favorite) =>
      repository.addFavorite(favorite);
}
