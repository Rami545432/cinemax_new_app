import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:movify/core/ads/ad_helper.dart';
import 'package:movify/core/ads/consent_manager.dart';
import 'package:movify/core/network/connectivity/connectivity_cubit.dart';
import 'package:movify/core/utils/app_colors.dart';

class MrecAdWidget extends StatefulWidget {
  const MrecAdWidget({super.key});

  @override
  State<MrecAdWidget> createState() => _MrecAdWidgetState();
}

class _MrecAdWidgetState extends State<MrecAdWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  BannerAd? _mrecAd;
  bool _isLoaded = false;
  bool _isLoading = false;
  int _numLoadAttempts = 0;
  static const int maxFailedLoadAttempts = 5;
  AdSize? _adSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isLoaded && !_isLoading && _mrecAd == null) {
      _loadAd();
    }
  }

  void _loadAd() async {
    await ConsentManager.waitForInitialization;
    if (!await ConsentManager.canRequestAds()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _adSize = AdSize.mediumRectangle; // Strictly 300x250 for MREC ads!

    _mrecAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: _adSize!,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) {
            setState(() {
              _numLoadAttempts = 0;
              _isLoaded = true;
              _isLoading = false;
            });
          }
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('MREC Ad failed to load: $err');
          ad.dispose();
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }

          _numLoadAttempts++;
          if (_numLoadAttempts <= maxFailedLoadAttempts) {
            final backoffSeconds = 1 << (_numLoadAttempts - 1);
            Future.delayed(Duration(seconds: backoffSeconds), () {
              if (mounted && !_isLoaded && !_isLoading) {
                _loadAd();
              }
            });
          }
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _mrecAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<ConnectivityCubit, NetworkStatus>(
        listenWhen: (previous, current) => current == NetworkStatus.connected,
        listener: (context, state) {
          if (!_isLoaded && !_isLoading) {
            _loadAd();
          }
        },
        child: BuildMrecAdWidget(
          isLoaded: _isLoaded,
          mrecAd: _mrecAd,
          adSize: _adSize,
        ),
      );
  }
}

class BuildMrecAdWidget extends StatelessWidget {
  const BuildMrecAdWidget({
    super.key,
    required this.isLoaded,
    required this.mrecAd,
    required this.adSize,
  });

  final bool isLoaded;
  final BannerAd? mrecAd;
  final AdSize? adSize;

  @override
  Widget build(BuildContext context) {
    if (isLoaded && mrecAd != null && adSize != null) {
      return Container(
        alignment: Alignment.center,
        width: adSize!.width.toDouble(),
        height: adSize!.height.toDouble(),
        margin: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: AppPrimaryColors.dark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: AdWidget(ad: mrecAd!),
      );
    }
    // Return a placeholder box while loading to prevent layout shift (CLS)
    return Container(
      width: 300,
      height: 250,
      margin: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: AppPrimaryColors.dark.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}
