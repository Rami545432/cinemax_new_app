// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of '../../../details/domain/entites/movie_details_entity.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class MovieDetailsEntityAdapter extends TypeAdapter<MovieDetailsEntity> {
//   @override
//   final int typeId = 7;

//   @override
//   MovieDetailsEntity read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return MovieDetailsEntity(
//       duration: fields[2] as int,
//       actorName: (fields[3] as List).cast<Cast>(),
//       movieStatus: fields[4] as String,
//       companies: (fields[5] as List?)?.cast<ProductionCompany>(),
//       kRevenue: fields[0] as int?,
//       kBudget: fields[1] as int?,
//       kLanguages: fields[7] as String?,
//       countries: (fields[6] as List?)?.cast<ProductionCountry>(),
//       kCredits: fields[8] as Credits?,
//       genres: (fields[11] as List).cast<int>(),
//       overView: fields[12] as String,
//       kVideos: fields[9] as Videos?,
//       movieTitle: fields[10] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, MovieDetailsEntity obj) {
//     writer
//       ..writeByte(13)
//       ..writeByte(0)
//       ..write(obj.kRevenue)
//       ..writeByte(1)
//       ..write(obj.kBudget)
//       ..writeByte(2)
//       ..write(obj.duration)
//       ..writeByte(3)
//       ..write(obj.actorName)
//       ..writeByte(4)
//       ..write(obj.movieStatus)
//       ..writeByte(5)
//       ..write(obj.companies)
//       ..writeByte(6)
//       ..write(obj.countries)
//       ..writeByte(7)
//       ..write(obj.kLanguages)
//       ..writeByte(8)
//       ..write(obj.kCredits)
//       ..writeByte(9)
//       ..write(obj.kVideos)
//       ..writeByte(10)
//       ..write(obj.movieTitle)
//       ..writeByte(11)
//       ..write(obj.genres)
//       ..writeByte(12)
//       ..write(obj.overView);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is MovieDetailsEntityAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
