import 'package:cinemax_app_new/core/utils/enums/content_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/favorite_entity.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@freezed
@HiveType(typeId: 0)
class FavoriteModel with _$FavoriteModel {
  @HiveField(0)
  const factory FavoriteModel({
    @HiveField(1) required int id,
    @HiveField(2) required String title,
    @HiveField(3) required String posterImage,
    @HiveField(4) required List<String> gener,
    @HiveField(5) required ContentType contentType,
    @HiveField(6) required String date,
    @HiveField(7) @Default('guest') String userId,
    @HiveField(8) @Default(false) bool isSynced,
    @HiveField(9) required int seasonNumber,
    @HiveField(10) required int specificId,
    @HiveField(11) required String seasonPosterUrl,
    @HiveField(12) required String backGroundImage,
    @HiveField(13) required int episodeNumber,
    @HiveField(14) required num rating,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  factory FavoriteModel.fromEntity(FavoriteEntity entity) => FavoriteModel(
    id: entity.id,
    title: entity.title,
    posterImage: entity.posterImage,
    gener: entity.gener,
    contentType: entity.contentType,
    date: entity.date,
    userId: entity.userId,
    isSynced: entity.isSynced,
    seasonNumber: entity.seasonNumber,
    specificId: entity.specificId,
    seasonPosterUrl: entity.posterImage,
    backGroundImage: entity.backGroundImage,
    episodeNumber: entity.episodeNumber,
    rating: entity.rating,
  );
}

extension FavoriteModelX on FavoriteModel {
  FavoriteEntity toEntity() => FavoriteEntity(
    id: id,
    title: title,
    posterImage: posterImage,
    gener: gener,
    contentType: contentType,
    date: date,
    userId: userId,
    isSynced: isSynced,
    seasonNumber: seasonNumber,
    specificId: specificId,
    posterImageBackup: seasonPosterUrl,
    backGroundImage: backGroundImage,
    episodeNumber: episodeNumber,
    rating: rating,
  );
}
