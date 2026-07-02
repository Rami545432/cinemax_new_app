import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:movify/core/ads/ad_helper.dart';

part 'interstitial_ad_state.dart';

class InterstitialAdCubit extends Cubit<InterstitialAdState> {
  int _showAttempts = 0;
  int _numLoadAttempts = 0;
  static const int maxFailedLoadAttempts = 5;

  InterstitialAdCubit() : super(InterstitialAdInitial()) {
    loadAd();
  }

  void loadAd() {
    if (state is InterstitialAdLoading || state is InterstitialAdLoaded) {
      return; // Already loading or loaded
    }

    emit(InterstitialAdLoading());

    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _numLoadAttempts = 0; // Reset attempts on success
          emit(InterstitialAdLoaded(ad));
        },
        onAdFailedToLoad: (error) {
          debugPrint('InterstitialAd failed to load: $error');
          emit(InterstitialAdFailed(error.message));
          
          _numLoadAttempts++;
          if (_numLoadAttempts <= maxFailedLoadAttempts) {
            // Exponential backoff: 1, 2, 4, 8, 16 seconds
            final backoffSeconds = 1 << (_numLoadAttempts - 1); 
            Future.delayed(Duration(seconds: backoffSeconds), () {
              if (!isClosed) {
                loadAd();
              }
            });
          }
        },
      ),
    );
  }

  void showAd() {
    _showAttempts++;

    if (_showAttempts % AdHelper.interstitialFrequency != 0) {
      return;
    }

    _showAttempts = 0;

    if (state is InterstitialAdLoaded) {
      final ad = (state as InterstitialAdLoaded).ad;

      ad.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          emit(InterstitialAdInitial());
          loadAd(); // Preload the next one immediately
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          debugPrint('Failed to show InterstitialAd: $error');
          ad.dispose();
          emit(InterstitialAdInitial());
          loadAd();
        },
      );

      ad.show();
    } else {
      // If ad wasn't ready, just trigger a load so it might be ready next time
      loadAd();
    }
  }

  @override
  Future<void> close() {
    if (state is InterstitialAdLoaded) {
      (state as InterstitialAdLoaded).ad.dispose();
    }
    return super.close();
  }
}
