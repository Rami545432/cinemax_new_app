import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ConsentManager {
  static final Completer<void> _initCompleter = Completer<void>();

  /// Wait for this future before trying to request an ad
  static Future<void> get waitForInitialization => _initCompleter.future;
  static Future<void> initialize({
    required VoidCallback onConsentGathered,
    bool debugMode = false,
  }) async {
    ConsentDebugSettings? debugSettings;

    if (debugMode) {
      debugSettings = ConsentDebugSettings(
        debugGeography: DebugGeography.debugGeographyEea,
        // Add your test device ID here (shown in logcat/console when running debug)
        testIdentifiers: ['0F05664F1841D3BE578CF9AE476227DE'],
      );
    }

    final params = ConsentRequestParameters(
      consentDebugSettings: debugSettings,
      // Set true if your app is child-directed (COPPA)
      tagForUnderAgeOfConsent: false,
    );

    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () async {
        // Consent info updated successfully, now load form if required
        await _loadAndShowForm(onConsentGathered);
        debugPrint(
          'Consent status: ${await ConsentInformation.instance.getConsentStatus()}',
        );
        debugPrint(
          'Privacy options status: ${await ConsentInformation.instance.getPrivacyOptionsRequirementStatus()}',
        );
      },
      (error) {
        // Failed to update consent info - still let the callback fire
        // so the app doesn't get stuck

        debugPrint('Consent info update failed: ${error.message}');
        onConsentGathered();
        if (!_initCompleter.isCompleted) {
          _initCompleter.complete();
        }
      },
    );
  }

  static Future<void> _loadAndShowForm(VoidCallback onConsentGathered) async {
    ConsentForm.loadAndShowConsentFormIfRequired((formError) {
      if (formError != null) {
        debugPrint('Consent form error: ${formError.message}');
      }
      // Whether or not a form was shown, check if we can request ads
      onConsentGathered();
      if (!_initCompleter.isCompleted) {
        _initCompleter.complete();
      }
    });
  }

  /// Call this before requesting any ad (banner/interstitial)
  static Future<bool> canRequestAds() async =>
      ConsentInformation.instance.canRequestAds();

  /// Whether to show a "Privacy Options" entry in your settings screen
  static Future<bool> isPrivacyOptionsRequired() async {
    final status = await ConsentInformation.instance
        .getPrivacyOptionsRequirementStatus();
    return status == PrivacyOptionsRequirementStatus.required;
  }

  /// Call this when user taps "Privacy Options" / "Manage Consent" in Settings
  static Future<void> showPrivacyOptionsForm() async {
    ConsentForm.showPrivacyOptionsForm((formError) {
      if (formError != null) {
        debugPrint('Privacy options form error: ${formError.message}');
      }
    });
  }
}
