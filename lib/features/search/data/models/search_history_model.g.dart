// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchHistoryModelAdapter extends TypeAdapter<SearchHistoryModel> {
  @override
  final int typeId = 2;

  @override
  SearchHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchHistoryModel(
      query: fields[0] as String,
      searchedAt: fields[1] as DateTime,
      posterPath: fields[2] as String,
      id: fields[3] as int,
      historyContentType: fields[4] as ContentType,
      rating: fields[5] as double,
      date: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchHistoryModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.query)
      ..writeByte(1)
      ..write(obj.searchedAt)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.historyContentType)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
