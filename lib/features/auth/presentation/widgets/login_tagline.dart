import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/l10n/app_localizations.dart';

class LoginTagline extends StatelessWidget {
  const LoginTagline({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      spacing: 12,
      children: [
        Text(
          l10n.signInHint,
          style: AppStyles.textStyle24(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
