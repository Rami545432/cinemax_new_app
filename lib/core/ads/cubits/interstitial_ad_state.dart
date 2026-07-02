part of 'interstitial_ad_cubit.dart';

@immutable
abstract class InterstitialAdState extends Equatable {
  const InterstitialAdState();

  @override
  List<Object?> get props => [];
}

class InterstitialAdInitial extends InterstitialAdState {}

class InterstitialAdLoading extends InterstitialAdState {}

class InterstitialAdLoaded extends InterstitialAdState {
  final InterstitialAd ad;

  const InterstitialAdLoaded(this.ad);

  @override
  List<Object?> get props => [ad.hashCode]; // Using hashCode since Ad is not Equatable
}

class InterstitialAdFailed extends InterstitialAdState {
  final String error;

  const InterstitialAdFailed(this.error);

  @override
  List<Object?> get props => [error];
}
