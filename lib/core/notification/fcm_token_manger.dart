import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

typedef UidProvider = String? Function();

class FcmTokenManager {
  FcmTokenManager({
    required FirebaseMessaging messaging,
    required FirebaseFirestore firestore,
    required UidProvider uidProvider,
    required Future<void> Function() resubscribeTopics,
    this.deleteTokenOnLogout = true,
  }) : _messaging = messaging,
       _firestore = firestore,
       _uidProvider = uidProvider,
       _resubscribeTopics = resubscribeTopics;

  final FirebaseMessaging _messaging;
  final FirebaseFirestore _firestore;
  final UidProvider _uidProvider;
  final Future<void> Function() _resubscribeTopics;

  /// If true, deleting token on logout prevents pushes reaching this device
  /// until next login generates a new token.
  final bool deleteTokenOnLogout;

  bool _initialized = false;

  // ---------------------------
  // Public API
  // ---------------------------

  /// Call once on app startup
  Future<void> init() async {
    if (_initialized) {
      return;
    }
    _initialized = true;

    await syncToken();

    _messaging.onTokenRefresh.listen((newToken) async {
      debugPrint('🔄 FCM token refreshed: $newToken');

      await _saveTokenToFirestore(newToken);

      // Important: token refresh can lose topic subscriptions in edge cases,
      // re-subscribe to ensure reliability.
      await _resubscribeTopics();
    });
  }

  /// Call on startup and after login to ensure token saved to current user
  Future<void> syncToken() async {
    try {
      final token = await _messaging.getToken();
      debugPrint('📌 Current FCM token: $token');

      if (token == null) {
        return;
      }

      await _saveTokenToFirestore(token);
    } catch (e, st) {
      debugPrint('❌ Error syncing FCM token: $e');
      debugPrintStack(stackTrace: st);
    }
  }

  /// Call on logout if you want to detach token from the user
  Future<void> logoutCleanup() async {
    try {
      final uid = _uidProvider();
      if (uid == null) {
        return;
      }

      final token = await _messaging.getToken();
      if (token == null) {
        return;
      }

      // Remove from Firestore
      final doc = _firestore
          .collection('users')
          .doc(uid)
          .collection('fcm_tokens')
          .doc(token);

      await doc.delete();
      debugPrint('🗑️ Removed FCM token doc for user=$uid');

      if (deleteTokenOnLogout) {
        // This makes Firebase generate a new token next time,
        // good for privacy / shared devices.
        await _messaging.deleteToken();
        debugPrint('🧨 Device token deleted (will regenerate later)');
      }
    } catch (e, st) {
      debugPrint('❌ Error during logout cleanup: $e');
      debugPrintStack(stackTrace: st);
    }
  }

  /// Optional: run on login/startup occasionally to clean stale tokens
  Future<void> cleanupStaleTokens({int days = 30}) async {
    try {
      final uid = _uidProvider();
      if (uid == null) {
        return;
      }

      final cutoffDate = DateTime.now().subtract(Duration(days: days));
      final cutoffTimestamp = Timestamp.fromDate(cutoffDate);

      final col = _firestore
          .collection('users')
          .doc(uid)
          .collection('fcm_tokens');

      final snapshot = await col
          .where('lastSeenAt', isLessThan: cutoffTimestamp)
          .get();

      if (snapshot.docs.isEmpty) {
        return;
      }

      final batch = _firestore.batch();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();

      debugPrint(
        '🧹 Cleaned ${snapshot.docs.length} stale tokens for user=$uid',
      );
    } catch (e, st) {
      debugPrint('❌ Error cleaning stale tokens: $e');
      debugPrintStack(stackTrace: st);
    }
  }

  // ---------------------------
  // Internals
  // ---------------------------

  Future<void> _saveTokenToFirestore(String token) async {
    try {
      final uid = _uidProvider();
      if (uid == null) {
        debugPrint('ℹ️ Guest mode: token not saved to Firestore.');
        return;
      }

      final doc = _firestore
          .collection('users')
          .doc(uid)
          .collection('fcm_tokens')
          .doc(token);

      await doc.set({
        "token": token,
        "platform": Platform.isAndroid ? "android" : "ios",
        "lastSeenAt": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      debugPrint('✅ FCM token saved/updated for user=$uid');
    } catch (e, st) {
      debugPrint('❌ Error saving token to Firestore: $e');
      debugPrintStack(stackTrace: st);
    }
  }
}
