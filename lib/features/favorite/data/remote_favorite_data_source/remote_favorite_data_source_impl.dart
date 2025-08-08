import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/favorite_model.dart';
import 'remote_favorite_data_source.dart';

class RemoteFavoriteDataSourceImpl implements RemoteFavoriteDataSource {
  final FirebaseFirestore _firestore;
  final String _collection = 'favorites';

  RemoteFavoriteDataSourceImpl({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<FavoriteModel>> getFavorites(String userId) async {
    try {
      final snapshot = await _firestore
          .collection(_collection)
          .where('userId', isEqualTo: userId)
          .get();

      return snapshot.docs
          .map((doc) => FavoriteModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get favorites: $e');
    }
  }

  @override
  Future<void> addFavorite(FavoriteModel favorite) async {
    try {
      await _firestore
          .collection(_collection)
          .doc(favorite.id.toString())
          .set(favorite.toJson());
    } catch (e) {
      throw Exception('Failed to add favorite: $e');
    }
  }

  @override
  Future<void> removeFavorite(int id) async {
    try {
      await _firestore.collection(_collection).doc(id.toString()).delete();
    } catch (e) {
      throw Exception('Failed to remove favorite: $e');
    }
  }

  @override
  Future<void> syncFavorites(List<FavoriteModel> favorites) async {
    try {
      final batch = _firestore.batch();

      for (var favorite in favorites) {
        final docRef = _firestore
            .collection(_collection)
            .doc(favorite.id.toString());
        batch.set(docRef, favorite.toJson());
      }

      await batch.commit();
    } catch (e) {
      throw Exception('Failed to sync favorites: $e');
    }
  }
}
