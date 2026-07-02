import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:movify/core/ads/ad_helper.dart';
import 'package:movify/core/network/connectivity/connectivity_cubit.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  bool _isLoading = false;
  int _numLoadAttempts = 0;
  static const int maxFailedLoadAttempts = 5;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isLoaded && !_isLoading) {
      _loadAd();
    }
  }

  Future<void> _loadAd() async {
    setState(() {
      _isLoading = true;
    });

    // Use a standard banner size (320x50) which is guaranteed to never clip.
    const size = AdSize.banner;

    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: size,
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
          debugPrint('BannerAd failed to load: $err');
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
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<ConnectivityCubit, NetworkStatus>(
        listenWhen: (previous, current) => current == NetworkStatus.connected,
        listener: (context, state) {
          if (!_isLoaded && !_isLoading) {
            _loadAd();
          }
        },
        child: BuildBannerAdWidget(isLoaded: _isLoaded, bannerAd: _bannerAd),
      );
}

class BuildBannerAdWidget extends StatelessWidget {
  const BuildBannerAdWidget({
    super.key,
    required this.isLoaded,
    required this.bannerAd,
  });

  final bool isLoaded;
  final BannerAd? bannerAd;

  @override
  Widget build(BuildContext context) {
    if (isLoaded && bannerAd != null) {
      return Container(
        width: bannerAd!.size.width.toDouble(),
        height: bannerAd!.size.height.toDouble(),
        // Add subtle visual separation
        decoration: BoxDecoration(
          // Try to match your bottom nav bar color
          border: Border(
            top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
          ),
        ),
        child: AdWidget(ad: bannerAd!),
      );
    }
    return const SizedBox.shrink();
  }
}
