import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

String formmatTime(int minutes, BuildContext context) {
  final hours = minutes ~/ 60;
  final remaingTime = minutes % 60;
  final l10n = AppLocalizations.of(context)!;
  if (hours > 0) {
    return l10n.durationFormat(hours, remaingTime);
  } else {
    return l10n.durationFormat(0, minutes);
  }
}
