import 'package:cinemax_app_new/core/utils/details_widgets/more_less_button.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomDescreption extends StatelessWidget {
  const CustomDescreption({super.key, required this.overview});
  final String overview;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        overview == ''
            ? Text(
                l10n.noDescriptionAvailable,
                style: AppStyles.textStyle16(context),
              )
            : Text(l10n.storyLine, style: AppStyles.textStyle18(context)),
        const SizedBox(height: 8),
        MoreLessButton(overview: overview),
      ],
    );
  }
}
