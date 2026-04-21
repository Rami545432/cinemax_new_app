import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/features/profile/presentation/views/profile_body.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profile, style: AppStyles.textStyle24(context)),
      ),
      body: const SafeArea(child: ProfileViewBody()),
    );
  }
}
