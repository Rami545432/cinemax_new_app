import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class InitializeHelper {
  Future<FormError?> initiliaze() async {
    final completer = Completer<FormError?>();
    final params = ConsentRequestParameters(
      consentDebugSettings: ConsentDebugSettings(
        debugGeography: DebugGeography.debugGeographyEea,
      ),
    );
    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () async {
        if (await ConsentInformation.instance.isConsentFormAvailable()) {
          await _loadConsentForm();
        } else {
          await _initilize();
        }
        completer.complete();
      },
      (formError) {
        completer.complete(formError);
      },
    );
    return completer.future;
  }

  Future<FormError?> _loadConsentForm() async {
    final completer = Completer<FormError?>();

    ConsentForm.loadConsentForm(
      (consentform) async {
        final status = await ConsentInformation.instance.getConsentStatus();
        if (status == ConsentStatus.required) {
          consentform.show((consentFormError) {
            completer.complete(_loadConsentForm());
          });
        } else {
          await _initilize();
          completer.complete();
        }
      },
      (formError) {
        completer.complete(formError);
      },
    );

    return completer.future;
  }

  Future<InitializationStatus> _initilize() async =>
      MobileAds.instance.initialize();
}
