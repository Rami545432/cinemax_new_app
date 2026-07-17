import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/ads/cubits/interstitial_ad_cubit.dart';
import 'package:movify/features/details/presentation/core/details_data_navigation.dart';
import 'package:movify/features/details/presentation/views/details_view_body.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.data, this.heroTag});

  final DetailsNavigationData data;
  final String? heroTag;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();
    // Trigger on enter (after Hero animation)
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        context.read<InterstitialAdCubit>().showAd();
      }
    });
  }

  @override
  Widget build(BuildContext context) => PopScope(
    onPopInvokedWithResult: (didPop, result) {
      // Trigger on exit
      if (didPop) {
        context.read<InterstitialAdCubit>().showAd();
      }
    },
    child: Scaffold(
      body: DetailsBody(navigationData: widget.data, heroTag: widget.heroTag),
    ),
  );
}
