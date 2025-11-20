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
      date: fields[1] as String,
      historyType: fields[2] as String,
      id: fields[3] as int,
      historyHorizontalCardImage: fields[4] as String,
      historyVerticalCardImage: fields[5] as String,
      historyContentType: fields[6] as ContentType?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchHistoryModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.query)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.historyType)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.historyHorizontalCardImage)
      ..writeByte(5)
      ..write(obj.historyVerticalCardImage)
      ..writeByte(6)
      ..write(obj.historyContentType);
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
