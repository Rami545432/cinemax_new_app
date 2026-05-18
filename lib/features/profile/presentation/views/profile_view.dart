import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/profile/presentation/views/profile_body.dart';
import 'package:movify/l10n/app_localizations.dart';

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
