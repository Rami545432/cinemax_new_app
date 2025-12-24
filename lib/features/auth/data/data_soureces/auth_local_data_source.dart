import 'dart:convert';

import 'package:cinemax_app_new/core/utils/errors/errors.dart';
import 'package:cinemax_app_new/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearCache();
  Future<void> setGuestMode(bool isGuest);
  Future<bool> getGuestMode();
  Future<void> clearGuestMode();
  Future<bool> getFirstTime();
  Future<void> setFirstTime(bool isFirstTime);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _cachedUserKey = 'CACHED_USER';
  static const String _firstTimeKey = 'IS_FIRST_TIME';
  static const String _guestModeKey = 'IS_GUEST_MODE';
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      final jsonString = json.encode(user.toJson());
      await sharedPreferences.setString(_cachedUserKey, jsonString);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Failed to cache user');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await sharedPreferences.remove(_cachedUserKey);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Failed to clear cache');
    }
  }

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final jsonString = sharedPreferences.getString(_cachedUserKey);
      if (jsonString == null) {
        return null;
      }
      final jsonMap = json.decode(jsonString);
      return UserModel.fromJson(jsonMap);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Failed to get cached user');
    }
  }

  @override
  Future<bool> getFirstTime() async {
    return sharedPreferences.getBool(_firstTimeKey) ?? true;
  }

  @override
  Future<void> setFirstTime(bool isFirstTime) async {
    await sharedPreferences.setBool(_firstTimeKey, isFirstTime);
  }

  @override
  Future<bool> getGuestMode() async {
    return sharedPreferences.getBool(_guestModeKey) ?? false;
  }

  @override
  Future<void> setGuestMode(bool isGuest) async {
    await sharedPreferences.setBool(_guestModeKey, isGuest);
  }

  @override
  Future<void> clearGuestMode() async {
    await sharedPreferences.remove(_guestModeKey);
  }
}
