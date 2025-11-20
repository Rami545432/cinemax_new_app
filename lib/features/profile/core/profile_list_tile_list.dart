import 'package:cinemax_app_new/core/routing/route_name.dart';
import 'package:cinemax_app_new/core/theme/widgets/theme_mode_selecation.dart';
import 'package:cinemax_app_new/features/profile/core/profile_list_tile_model.dart';
import 'package:cinemax_app_new/features/profile/presentaion/widgets/languages_switcher.dart';
import 'package:cinemax_app_new/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

List<ProfileIstTileModel> profileListTileList(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  return [
    ProfileIstTileModel(
      title: l10n.favorites,
      icon: Icons.favorite_outline_rounded,
      onTap: () {
        context.pushNamed(RouteName.favorite);
      },
    ),
    ProfileIstTileModel(
      title: l10n.clearHistory,
      icon: Icons.delete_outline,
      onTap: () {},
    ),
    ProfileIstTileModel(
      title: l10n.language,
      icon: Icons.language_outlined,
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.95,
          ),
          builder: (context) => LanguagesSwitcher(),
        );
      },
    ),

    ProfileIstTileModel(
      icon: FontAwesomeIcons.palette,
      title: l10n.theme,
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          showDragHandle: true,
          useSafeArea: true,
          context: context,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 0.95,
          ),
          builder: (context) => ThemeModeSelectaion(),
        );
      },
    ),
  ];
}
