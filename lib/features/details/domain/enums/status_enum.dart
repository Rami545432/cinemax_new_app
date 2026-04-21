import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

enum StatusType { released, canceled, returning, ended, unknown, inProduction }

extension StatusLocalization on StatusType {
  String localized(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return switch (this) {
      StatusType.released => l10n.statusReleased,
      StatusType.ended => l10n.statusEnded,
      StatusType.returning => l10n.statusReturningSeries,
      StatusType.inProduction => l10n.statusInProduction,
      StatusType.canceled => l10n.statusCanceled,
      StatusType.unknown => l10n.statusUnknown,
    };
  }
}
