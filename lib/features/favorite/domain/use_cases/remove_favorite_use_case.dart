import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movify/core/errors/failure.dart';
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/domain/repos/favorite_repo.dart';

@lazySingleton
class RemoveFavoriteUseCase {
  final FavoriteRepo repository;

  RemoveFavoriteUseCase(this.repository);

  Future<Either<Failure, Unit>> call({
    required int specificId,
    required ContentType contentType,
    required String userId,
  }) => repository.removeFavorite(
    specificId: specificId,
    contentType: contentType,
    userId: userId,
  );
}
