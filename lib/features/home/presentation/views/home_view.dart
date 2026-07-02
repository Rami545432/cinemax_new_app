import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/home/presentation/views/home_view_body.dart';
import 'package:movify/l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
            overlayColor: WidgetStateProperty.all(Colors.blueGrey[200]),
            tabs: [
              Tab(text: l10n.movies),
              Tab(text: l10n.tvShows),
            ],
          ),
        ),
        body: const SafeArea(
          child: Column(children: [Expanded(child: HomeViewBody())]),
        ),
      ),
    );
  }
}
