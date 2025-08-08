// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteModelAdapter extends TypeAdapter<FavoriteModel> {
  @override
  final int typeId = 0;

  @override
  FavoriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteModel(
      id: fields[1] as int,
      title: fields[2] as String,
      imageUrl: fields[3] as String,
      gener: (fields[4] as List).cast<String>(),
      contentType: fields[5] as ContentType,
      date: fields[6] as String,
      userId: fields[7] as String,
      isSynced: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.gener)
      ..writeByte(5)
      ..write(obj.contentType)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.userId)
      ..writeByte(8)
      ..write(obj.isSynced);
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
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      gener: (json['gener'] as List<dynamic>).map((e) => e as String).toList(),
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      date: json['date'] as String,
      userId: json['userId'] as String? ?? 'guest',
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$FavoriteModelImplToJson(_$FavoriteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'gener': instance.gener,
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
      'date': instance.date,
      'userId': instance.userId,
      'isSynced': instance.isSynced,
    };

const _$ContentTypeEnumMap = {
  ContentType.movies: 'movies',
  ContentType.series: 'series',
  ContentType.seasons: 'seasons',
  ContentType.episodes: 'episodes',
};
