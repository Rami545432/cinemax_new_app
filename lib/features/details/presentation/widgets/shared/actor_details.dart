import 'package:flutter/material.dart';
import 'package:movify/core/utils/app_styles.dart';
import 'package:movify/features/details/domain/value_objects/cast.dart';
import 'package:movify/l10n/app_localizations.dart';

class ActorDetails extends StatelessWidget {
  const ActorDetails({super.key, required this.actorList});

  final Cast actorList;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final name = actorList.name ?? l10n.unknown;
    final character = actorList.character ?? l10n.unknown;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: .center,
      children: [
        Text(name, style: AppStyles.textStyle16(context)),
        const SizedBox(height: 4),
        Text(character, style: AppStyles.textStyle14(context)),
      ],
    );
  }
}
