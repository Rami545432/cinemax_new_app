// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteModelAdapter extends TypeAdapter<FavoriteModel> {
  @override
  final int typeId = 4;

  @override
  FavoriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteModel(
      specificId: fields[1] as int,
      title: fields[3] as String,
      posterImage: fields[4] as String,
      backdropImage: fields[5] as String,
      genres: (fields[6] as List).cast<int>(),
      date: fields[7] as String,
      rating: fields[8] as double,
      seasonNumber: fields[9] == null ? 0 : fields[9] as int,
      episodeNumber: fields[10] == null ? 0 : fields[10] as int,
      userId: fields[11] == null ? 'guest' : fields[11] as String,
      isSynced: fields[12] == null ? false : fields[12] as bool,
      lastSyncedAt: fields[13] as DateTime?,
      tmbdId: fields[14] == null ? 0 : fields[14] as int,
      contentType: fields[2] as ContentType,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.specificId)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.posterImage)
      ..writeByte(5)
      ..write(obj.backdropImage)
      ..writeByte(6)
      ..write(obj.genres)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.seasonNumber)
      ..writeByte(10)
      ..write(obj.episodeNumber)
      ..writeByte(11)
      ..write(obj.userId)
      ..writeByte(12)
      ..write(obj.isSynced)
      ..writeByte(13)
      ..write(obj.lastSyncedAt)
      ..writeByte(14)
      ..write(obj.tmbdId)
      ..writeByte(2)
      ..write(obj.contentType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteModelImpl _$$FavoriteModelImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteModelImpl(
      specificId: (json['specificId'] as num).toInt(),
      title: json['title'] as String,
      posterImage: json['posterImage'] as String,
      backdropImage: json['backdropImage'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      date: json['date'] as String,
      rating: (json['rating'] as num).toDouble(),
      seasonNumber: (json['seasonNumber'] as num?)?.toInt() ?? 0,
      episodeNumber: (json['episodeNumber'] as num?)?.toInt() ?? 0,
      userId: json['userId'] as String? ?? 'guest',
      isSynced: json['isSynced'] as bool? ?? false,
      lastSyncedAt: json['lastSyncedAt'] == null
          ? null
          : DateTime.parse(json['lastSyncedAt'] as String),
      tmbdId: (json['tmbdId'] as num?)?.toInt() ?? 0,
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) =>
    <String, dynamic>{
      'specificId': instance.specificId,
      'title': instance.title,
      'posterImage': instance.posterImage,
      'backdropImage': instance.backdropImage,
      'genres': instance.genres,
      'date': instance.date,
      'rating': instance.rating,
      'seasonNumber': instance.seasonNumber,
      'episodeNumber': instance.episodeNumber,
      'userId': instance.userId,
      'isSynced': instance.isSynced,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
      'tmbdId': instance.tmbdId,
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
    };

const _$ContentTypeEnumMap = {
  ContentType.movies: 'movies',
  ContentType.series: 'series',
  ContentType.seasons: 'seasons',
  ContentType.episodes: 'episodes',
};
