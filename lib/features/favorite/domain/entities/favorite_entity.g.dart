// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteEntityImpl _$$FavoriteEntityImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      posterImage: json['posterImage'] as String,
      gener: (json['gener'] as List<dynamic>).map((e) => e as String).toList(),
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      date: json['date'] as String,
      userId: json['userId'] as String? ?? 'guest',
      isSynced: json['isSynced'] as bool? ?? false,
      seasonNumber: json['seasonNumber'] as int,
      specificId: json['specificId'] as int,
      posterImageBackup: json['posterImageBackup'] as String,
      backGroundImage: json['backGroundImage'] as String,
      episodeNumber: json['episodeNumber'] as int,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$FavoriteEntityImplToJson(
  _$FavoriteEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'posterImage': instance.posterImage,
  'gener': instance.gener,
  'contentType': _$ContentTypeEnumMap[instance.contentType]!,
  'date': instance.date,
  'userId': instance.userId,
  'isSynced': instance.isSynced,
  'seasonNumber': instance.seasonNumber,
  'specificId': instance.specificId,
  'posterImageBackup': instance.posterImageBackup,
  'backGroundImage': instance.backGroundImage,
  'episodeNumber': instance.episodeNumber,
  'rating': instance.rating,
};

const _$ContentTypeEnumMap = {
  ContentType.movies: 'movies',
  ContentType.series: 'series',
  ContentType.seasons: 'seasons',
  ContentType.episodes: 'episodes',
};
