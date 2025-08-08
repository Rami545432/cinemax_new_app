import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/enums/content_type.dart';

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
    @Default('guest') String userId,
    @Default(false) bool isSynced,
  }) = _FavoriteEntity;

  factory FavoriteEntity.fromJson(Map<String, dynamic> json) =>
      _$FavoriteEntityFromJson(json);
}
