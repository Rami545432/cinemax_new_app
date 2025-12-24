import 'package:cinemax_app_new/config/animations/extensions/widget_animations.dart';
import 'package:cinemax_app_new/features/details/presentation/widgets/details_widgets/custom_descreption.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/genre.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/results.dart';
import 'package:cinemax_app_new/features/discover/data/models/genre_filter.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'about_tab_view_branch.dart';
import 'genre_row.dart';

class AboutTabBarView extends StatelessWidget {
  const AboutTabBarView({
    super.key,
    required this.overview,
    required this.geners,
    required this.child,
    this.watchProviders,
    required this.genreCategory,
  });

  final String overview;
  final List<Genre> geners;
  final Widget child;
  final Results? watchProviders;
  final GenreCategory genreCategory;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        CustomDescreption(overview: overview),
        SizedBox(height: 10),

        Divider(),
        AboutTabViewBranch(
          title: l10n.geners,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GenreRow(geners: geners, genreCategory: genreCategory),
          ),
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),

        child,
      ].animateList(),
    );
  }
}
