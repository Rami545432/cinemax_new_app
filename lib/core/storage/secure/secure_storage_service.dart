import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );
  static const String _firebaseTokenKey = 'firebase_token';
  static const String _userIdKey = 'user_id';
  static Future<void> saveFireBaseToken(String token) async {
    try {
      await _storage.write(key: _firebaseTokenKey, value: token);
      log('Firebase token saved successfully');
    } catch (e) {
      log('Error saving Firebase token: $e');
    }
  }

  static Future<String?> getFireBaseToken() async {
    try {
      return await _storage.read(key: _firebaseTokenKey);
    } catch (e) {
      log('Error getting Firebase token: $e');
      return null;
    }
  }

  static Future<void> storeUserId(String userId) async {
    try {
      await _storage.write(key: _userIdKey, value: userId);
      log('User ID saved successfully');
    } catch (e) {
      log('Error saving User ID: $e');
    }
  }

  static Future<String?> getUserId() async {
    try {
      return await _storage.read(key: _userIdKey);
    } catch (e) {
      log('Error getting User ID: $e');
      return null;
    }
  }

  static Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
      log('All data cleared successfully');
    } catch (e) {
      log('Error clearing data: $e');
    }
  }

  static Future<bool> hasUserCredentilas() async {
    final userId = await getUserId();
    final token = await getFireBaseToken();
    return userId != null && token != null;
  }
}
