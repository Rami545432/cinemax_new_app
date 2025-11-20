import 'package:cinemax_app_new/core/utils/app_styles.dart';
import 'package:cinemax_app_new/core/utils/details_widgets/custom_descreption.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/genre.dart';
import 'package:cinemax_app_new/features/details/data/models/shared_details_models/results.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'about_tab_view_branch.dart';
import 'gener_row.dart';

class AboutTabBarView extends StatelessWidget {
  const AboutTabBarView({
    super.key,
    required this.overview,
    required this.geners,
    required this.child,
    this.watchProviders,
  });

  final String overview;
  final List<Genre> geners;
  final Widget child;
  final Results? watchProviders;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        CustomDescreption(overview: overview),
        SizedBox(height: 10),
        if (watchProviders != null)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade700),
            ),
            child: Text(
              watchProviders!.toJson().toString(),
              style: AppStyles.textStyle14(context),
            ),
          ),
        Divider(),
        AboutTabViewBranch(
          title: l10n.geners,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GenersRow(geners: geners),
          ),
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),

        child,
      ],
    );
  }
}
