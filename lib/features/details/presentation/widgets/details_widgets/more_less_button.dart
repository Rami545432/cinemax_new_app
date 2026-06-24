import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movify/core/utils/app_colors.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/l10n/app_localizations.dart';
import 'package:movify/shared/presentation/widgets/secondry_button.dart';

class MoreLessButton extends HookWidget {
  const MoreLessButton({super.key, required this.overview});
  final String overview;
  @override
  Widget build(BuildContext context) {
    final isClicked = useState(false);
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: isClicked.value ? overview.length : 2,
          overflow: isClicked.value
              ? TextOverflow.visible
              : TextOverflow.ellipsis,
          overview,
          style: AppStyles.textStyle16(context),
        ),
        overview.length > 100
            ? SecondaryButton(
                onTap: () {
                  isClicked.value = !isClicked.value;
                },
                text: isClicked.value ? l10n.less : l10n.more,
                style: AppStyles.textStyle18(context).copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppPrimaryColors.blueAccent,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
