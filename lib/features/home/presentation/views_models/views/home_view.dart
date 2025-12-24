import 'package:cinemax_app_new/core/utils/app_colors.dart';
import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: double.infinity,
          leading: TabBar(
            dividerColor: Colors.transparent,
            labelStyle: AppStyles.textStyle16(context),
            labelColor: AppPrimaryColors.blueAccent,
            indicatorColor: AppPrimaryColors.blueAccent,
            overlayColor: WidgetStateProperty.all(Colors.blueGrey[200]!),
            tabs: [
              Tab(text: l10n.movies),
              Tab(text: l10n.tvShows),
            ],
          ),
        ),
        body: SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
