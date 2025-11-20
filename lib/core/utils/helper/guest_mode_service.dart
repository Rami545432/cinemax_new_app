// // core/utils/helper/guest_mode_service.dart
// import 'package:shared_preferences/shared_preferences.dart';

// class GuestModeService {
//   static const String _guestModeKey = 'isGuestMode';

//   static Future<bool> getGuestMode() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(_guestModeKey) ?? false;
//   }

//   static Future<void> setGuestMode(bool isGuest) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(_guestModeKey, isGuest);
//   }

//   static Future<void> clearGuestMode() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_guestModeKey);
//   }
// }
