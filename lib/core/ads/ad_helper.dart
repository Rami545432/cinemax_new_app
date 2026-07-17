import 'dart:io';

import 'package:movify/core/remote_config/remote_config_service.dart';

class AdHelper {
  // Replace these with your actual AdMob App IDs and Ad Unit IDs before releasing.
  static int interstitialFrequency =
      RemoteConfigService.instance.adFrequencyClicks;
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // Test Banner ID for Android
      return 'ca-app-pub-3940256099942544/9214589741';
    } else if (Platform.isIOS) {
      // Test Banner ID for iOS
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      // Test Interstitial ID for Android
      return 'ca-app-pub-3940256099942544/1033173712';
    } else if (Platform.isIOS) {
      // Test Interstitial ID for iOS
      return 'ca-app-pub-3940256099942544/4411468910';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      // Test Native Advanced ID for Android
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      // Test Native Advanced ID for iOS
      return 'ca-app-pub-3940256099942544/3986624511';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
