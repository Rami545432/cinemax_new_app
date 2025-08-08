// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContentTypeAdapter extends TypeAdapter<ContentType> {
  @override
  final int typeId = 1;

  @override
  ContentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ContentType.movies;
      case 1:
        return ContentType.series;
      case 2:
        return ContentType.seasons;
      case 3:
        return ContentType.episodes;
      default:
        return ContentType.movies; // default fallback
    }
  }

  @override
  void write(BinaryWriter writer, ContentType obj) {
    switch (obj) {
      case ContentType.movies:
        writer.writeByte(0);
        break;
      case ContentType.series:
        writer.writeByte(1);
        break;
      case ContentType.seasons:
        writer.writeByte(2);
        break;
      case ContentType.episodes:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
