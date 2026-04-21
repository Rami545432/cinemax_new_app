import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/domain/entities/favorite_entity.dart';
import 'package:cinemax_app_new/features/favorite/domain/repos/favorite_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFavoritesUseCase {
  final FavoriteRepo repository;

  GetFavoritesUseCase(this.repository);

  Future<Either<Failure, List<FavoriteEntity>>> call({
    required String userId,
    ContentType? contentType,
  }) =>
      repository.getFavorites(userId: userId, contentType: contentType);
}
