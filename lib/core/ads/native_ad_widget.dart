import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:movify/core/ads/ad_helper.dart';
import 'package:movify/core/utils/app_colors.dart';

class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? _nativeAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    _nativeAd = NativeAd(
      adUnitId: AdHelper.nativeAdUnitId,
      factoryId: '', // Factory ID is ignored when using nativeTemplateStyle
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: const Color(
          0xFF1F1D2B,
        ), // Matches your app's dark cards
        cornerRadius: 16.0, // Match Movie Cards border radius
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: Colors.white,
          backgroundColor: AppPrimaryColors.blueAccent, // Blue button
          style: NativeTemplateFontStyle.bold,
          size: 16.0,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.white,
          backgroundColor: const Color(0xFF1F1D2B),
          style: NativeTemplateFontStyle.bold,
          size: 16.0,
        ),
        secondaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.grey,
          backgroundColor: const Color(0xFF1F1D2B),
          style: NativeTemplateFontStyle.normal,
          size: 14.0,
        ),
        tertiaryTextStyle: NativeTemplateTextStyle(
          textColor: Colors.grey,
          backgroundColor: const Color(0xFF1F1D2B),
          style: NativeTemplateFontStyle.normal,
          size: 14.0,
        ),
      ),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Native Ad failed to load: $err');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoaded && _nativeAd != null) {
      return Container(
        alignment: Alignment.center,
        width: MediaQuery.widthOf(context), // Spans full width!
        // Native templates (TemplateType.medium) generally require a specific height.
        // Usually ~320 is recommended for Medium templates to avoid overflow.
        height: 320,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: 0.2,
              ), // Adds a nice subtle shadow

              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: AdWidget(ad: _nativeAd!),
      );
    }
    // Returns an empty box while loading
    return const SizedBox.shrink();
  }
}
