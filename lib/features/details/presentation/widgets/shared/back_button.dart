import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movify/core/ads/cubits/interstitial_ad_cubit.dart';

class LeadingBackButton extends StatelessWidget {
  const LeadingBackButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back_ios_new_rounded),
    onPressed: () {
      context.read<InterstitialAdCubit>().showAd();
      Navigator.of(context).pop();
    },
  );
}
