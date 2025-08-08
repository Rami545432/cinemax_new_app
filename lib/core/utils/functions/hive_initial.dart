// import 'package:hive_flutter/hive_flutter.dart';
// import '../../../constant.dart';
// import '../../../features/home/domian/entites/entity.dart';
// import '../../../features/home/domian/entites/movie_details_entity.dart';

// Future<void> hiveInitialize() async {
//   await Hive.initFlutter();
//   Hive.registerAdapter(MovieEntityAdapter());
//   Hive.registerAdapter(MovieDetailsEntityAdapter());
//   await Hive.openBox<MovieEntity>(popularBox);
//   final popular = Hive.box<MovieEntity>(popularBox);
//   await popular.clear();
//   var newset = await Hive.openBox<MovieEntity>(newsetBox);
//   await newset.clear();
//   await Hive.openBox<MovieEntity>(trendBox);
//   final trends = Hive.box<MovieEntity>(trendBox);
//   await trends.clear();
//   await Hive.openBox<MovieEntity>(recommendedBox);
//   final recommended = Hive.box<MovieEntity>(recommendedBox);
//   await recommended.clear();

// //  var details= await Hive.openBox<MovieDetailsEntity>(movieDetailtBox);
// //  await details.delete(movieDetailtBox);
// }

// // Future clearBox() async {
// //   var box = Hive.box<MovieEntity>(recommendedBox);
// //   var trendBoxing = Hive.box<MovieEntity>(trendBox);
// //   await trendBoxing.clear();
// //   await box.clear();
// // }
