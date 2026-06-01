import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movify/core/errors/expections.dart' as custom_exceptions;
import 'package:movify/core/utils/enums/content_type.dart';
import 'package:movify/features/favorite/data/data_sources/remote/remote_favorite_data_source.dart';
import 'package:movify/features/favorite/data/models/favorite_model.dart';
import 'package:movify/features/favorite/data/models/favorite_model_extenion.dart';

class RemoteFavoriteDataSourceImpl implements RemoteFavoriteDataSource {
  final FirebaseFirestore firestore;

  RemoteFavoriteDataSourceImpl({required this.firestore});

  /// Helper method to generate document ID
  String _generateDocId(int specificId, ContentType contentType) =>
      '${specificId}_${contentType.name}';

  /// Helper method to get the favorites collection reference for a user
  CollectionReference _getFavoritesCollection(String userId) =>
      firestore.collection('users').doc(userId).collection('favorites');

  @override
  Future<List<FavoriteModel>> getFavorites(String userId) async {
    try {
      final snapshot = await _getFavoritesCollection(userId).get();

      if (snapshot.docs.isEmpty) {
        return [];
      }

      final favorites = snapshot.docs
          .map((doc) {
            try {
              return FavoriteModelFirestoreX.fromFirestore(doc);
            } catch (e) {
              // Log error but continue processing other documents
              debugPrint('Error parsing favorite document ${doc.id}: $e');
              return null;
            }
          })
          .whereType<FavoriteModel>() // Filter out nulls
          .toList();

      return favorites;
    } on FirebaseException catch (e) {
      throw custom_exceptions.FirebaseException(
        'Failed to fetch favorites: ${e.message}',
      );
    } catch (e) {
      throw custom_exceptions.FirebaseException(
        'Unexpected error fetching favorites: $e',
      );
    }
  }

  @override
  Future<void> saveFavorite(FavoriteModel favorite) async {
    try {
      final docId = _generateDocId(favorite.specificId, favorite.contentType);

      await _getFavoritesCollection(
        favorite.userId,
      ).doc(docId).set(favorite.toFirestore());
    } on FirebaseException catch (e) {
      throw custom_exceptions.FirebaseException(
        'Failed to save favorite: ${e.message}',
      );
    } catch (e) {
      throw custom_exceptions.FirebaseException(
        'Unexpected error saving favorite: $e',
      );
    }
  }

  @override
  Future<void> batchSaveFavorites(List<FavoriteModel> favorites) async {
    if (favorites.isEmpty) {
      return;
    }

    try {
      // Firestore batch limit is 500 operations
      const batchLimit = 500;

      // Split favorites into chunks if needed
      for (var i = 0; i < favorites.length; i += batchLimit) {
        final end = (i + batchLimit < favorites.length)
            ? i + batchLimit
            : favorites.length;
        final chunk = favorites.sublist(i, end);

        // Create a new batch for this chunk
        final batch = firestore.batch();

        for (final favorite in chunk) {
          final docId = _generateDocId(
            favorite.specificId,
            favorite.contentType,
          );

          final docRef = _getFavoritesCollection(favorite.userId).doc(docId);

          batch.set(docRef, favorite.toFirestore());
        }

        // Commit this batch
        await batch.commit();
      }
    } on FirebaseException catch (e) {
      throw custom_exceptions.FirebaseException(
        'Failed to batch save favorites: ${e.message}',
      );
    } catch (e) {
      throw custom_exceptions.FirebaseException(
        'Unexpected error batch saving favorites: $e',
      );
    }
  }

  @override
  Future<void> deleteFavorite(
    String userId,
    int specificId,
    ContentType contentType,
  ) async {
    try {
      final docId = _generateDocId(specificId, contentType);

      await _getFavoritesCollection(userId).doc(docId).delete();
    } on FirebaseException catch (e) {
      throw custom_exceptions.FirebaseException(
        'Failed to delete favorite: ${e.message}',
      );
    } catch (e) {
      throw custom_exceptions.FirebaseException(
        'Unexpected error deleting favorite: $e',
      );
    }
  }

  @override
  Future<bool> isFavorite(
    String userId,
    int specificId,
    ContentType contentType,
  ) async {
    try {
      final docId = _generateDocId(specificId, contentType);

      final doc = await _getFavoritesCollection(userId).doc(docId).get();

      return doc.exists;
    } on FirebaseException catch (e) {
      throw custom_exceptions.FirebaseException(
        'Failed to check favorite existence: ${e.message}',
      );
    } catch (e) {
      throw custom_exceptions.FirebaseException(
        'Unexpected error checking favorite: $e',
      );
    }
  }
}
