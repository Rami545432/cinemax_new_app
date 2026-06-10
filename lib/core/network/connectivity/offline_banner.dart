import 'package:flutter/material.dart';
import 'package:movify/core/network/connectivity/banner_base.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/l10n/app_localizations.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) => BannerBase(
    color: AppSecondryColors.red,
    icon: Icons.wifi_off_rounded,
    text: AppLocalizations.of(context)!.noInternetConnection,
  );
}
