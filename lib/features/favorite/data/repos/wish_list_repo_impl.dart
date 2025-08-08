// import 'dart:developer';

// import '../../domain/entities/favorite_entity.dart';
// import '../../domain/repos/favorite_repo.dart';
// import '../remote_favorite_data_source/remote_favorite_data_source.dart';

// class WishListRepoImpl extends WishListRepo {
//   final RemoteWishListDataSource remoteWishListDataSource;

//   WishListRepoImpl({required this.remoteWishListDataSource});
//   @override
//   Future<void> addWishList(
//     int movieId,
//     String title,
//     String imageUrl,
//     String genre,
//     String type,
//     String userId,
//   ) async {
//     try {
//       await remoteWishListDataSource.addWishList(
//         movieId,
//         title,
//         imageUrl,
//         genre,
//         type,
//         userId,
//       );
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   @override
//   Future<void> deleteWishList(int movieId) async {
//     try {
//       await remoteWishListDataSource.deleteWishList(movieId);
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   @override
//   Stream<List<WishListEntity>> getFavorites(String userId) {
//     return remoteWishListDataSource.getFavorites(userId);
//   }
// }
