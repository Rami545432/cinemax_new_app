import 'package:cinemax_app_new/core/errors/errors.dart';
import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:cinemax_app_new/features/favorite/domain/repos/favorite_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveFavoriteUseCase {
  final FavoriteRepo repository;

  RemoveFavoriteUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required int specificId,
    required ContentType contentType,
    required String userId,
  }) =>
      repository.removeFavorite(
        specificId: specificId,
        contentType: contentType,
        userId: userId,
      );
}
