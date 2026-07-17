import 'package:flutter/material.dart';
import 'package:movify/core/network/connectivity/banner_base.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/l10n/app_localizations.dart';

class OnlineBanner extends StatelessWidget {
  const OnlineBanner({super.key});

  @override
  Widget build(BuildContext context) => BannerBase(
    color: AppSecondryColors.green,
    icon: Icons.wifi_rounded,
    text: AppLocalizations.of(context)!.backOnline,
  );
}
