import 'package:flutter/material.dart';
import 'package:movify/core/ads/consent_manager.dart';
import 'package:movify/features/profile/presentation/widgets/profile_container.dart';
import 'package:movify/l10n/app_localizations.dart';

class PrivacyButton extends StatelessWidget {
  const PrivacyButton({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder<bool>(
    future: ConsentManager.isPrivacyOptionsRequired(),
    builder: (context, snapshot) {
      final l10n = AppLocalizations.of(context)!;
      if (snapshot.data ?? false) {
        return ProfileContainer(
          title: l10n.privacySettings,
          icon: const Icon(Icons.privacy_tip),
          onTap: () async {
            await ConsentManager.showPrivacyOptionsForm();
          },
        );
      }
      return const SizedBox.shrink();
    },
  );
}
