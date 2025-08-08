// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
// import 'package:equatable/equatable.dart';

// part 'favorite_model.g.dart';

// enum ContentType { movie, series, season, episode }

// @HiveType(typeId: 0)
// class FavoriteModel extends HiveObject with EquatableMixin {
//   @HiveField(0)
//   final int id;
//   @HiveField(1)
//   final String title;
//   @HiveField(2)
//   final String imageUrl;
//   @HiveField(3)
//   final List<String> gener;
//   @HiveField(4)
//   final String type;
//   @HiveField(5)
//   final String date;
//   @HiveField(6)
//   final String userId; // For syncing with user account
//   @HiveField(7)
//   final bool isSynced; // To track if item is synced with cloud

//   FavoriteModel({
//     required this.id,
//     required this.title,
//     required this.imageUrl,
//     required this.gener,
//     required this.type,
//     required this.date,
//     this.userId = 'guest', // Default to guest
//     this.isSynced = false,
//   });

//   // Helper method to check if item is from guest
//   bool get isGuestItem => userId == 'guest';

//   // Helper method to get content type
//   ContentType get contentType {
//     switch (type.toLowerCase()) {
//       case 'movie':
//         return ContentType.movie;
//       case 'series':
//         return ContentType.series;
//       case 'season':
//         return ContentType.season;
//       case 'episode':
//         return ContentType.episode;
//       default:
//         return ContentType.movie;
//     }
//   }

//   // Create a copy of the model with updated fields
//   FavoriteModel copyWith({
//     int? id,
//     String? title,
//     String? imageUrl,
//     List<String>? gener,
//     String? type,
//     String? date,
//     String? userId,
//     bool? isSynced,
//   }) {
//     return FavoriteModel(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       imageUrl: imageUrl ?? this.imageUrl,
//       gener: gener ?? this.gener,
//       type: type ?? this.type,
//       date: date ?? this.date,
//       userId: userId ?? this.userId,
//       isSynced: isSynced ?? this.isSynced,
//     );
//   }

//   // Convert model to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'imageUrl': imageUrl,
//       'gener': gener,
//       'type': type,
//       'date': date,
//       'userId': userId,
//       'isSynced': isSynced,
//     };
//   }

//   // Create model from JSON
//   factory FavoriteModel.fromJson(Map<String, dynamic> json) {
//     return FavoriteModel(
//       id: json['id'] as int,
//       title: json['title'] as String,
//       imageUrl: json['imageUrl'] as String,
//       gener: List<String>.from(json['gener'] as List),
//       type: json['type'] as String,
//       date: json['date'] as String,
//       userId: json['userId'] as String? ?? 'guest',
//       isSynced: json['isSynced'] as bool? ?? false,
//     );
//   }

//   @override
//   List<Object?> get props => [id, title, type, userId];
// }
