import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_entity.freezed.dart';
part 'favorite_entity.g.dart';

@freezed
class FavoriteEntity with _$FavoriteEntity {
  const factory FavoriteEntity({
    required int id,
    required String title,
    required String imageUrl,
    required List<String> gener,
    required ContentType contentType,
    required String date,
    required int seasonNumber,
    required int specificId,
    required String seasonPosterUrl,
    required String backGroundImage,
    required int episodeNumber,

    @Default('guest') String userId,
    @Default(false) bool isSynced,
  }) = _FavoriteEntity;

  factory FavoriteEntity.fromJson(Map<String, dynamic> json) =>
      _$FavoriteEntityFromJson(json);
}
